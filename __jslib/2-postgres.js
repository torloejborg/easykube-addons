/**
 * @typedef SchemaOpts
 * @property {string[]} schemas - Name of additional schemas.
 */

/**
 * JS Functions for interacting with the Postgres addon (requires postgres)
 */
class Postgres {

    constructor() {
        this.deployment = "postgres";
        this.namespace = "default";
    }

    /**
     * Creates a new database in Postgres, the database will only be created if not exists
     * @param {string} database Database name. Owner will the same as database, e.g. mydb, will yield a user mydb.
     * @param {string[]} schema An optional list of schemas to create, schemas will be owned by the database user
     * @param {boolean} force if true, the existing database will be dropped and recreated
     * @returns {Postgres}
     */
    create(database, schema, force = false) {
        const cmd = "psql"

        const args = ["-XtA", "-c", `select 1
                                     from pg_database
                                     where datname = '${database}'`, "-U", "postgres"];

        const exists = easykube.runCommand(this.deployment, this.namespace, cmd, args);

        if (exists != null && exists.trimEnd() === "1" && force === false) {
            console.warn(`Database ${database} already exists, will not drop-create (unless forced by script)`);
        } else {
            const argArray = [
                ["-c", `drop database if exists ${database} with (FORCE)`, "-U", "postgres"],
                ["-c", `drop user if exists ${database}`, "-U", "postgres"],
                ["-c", `create user ${database} with superuser password '${database}'`, "-U", "postgres"],
                ["-c", `create database ${database} with owner '${database}'`, "-U", "postgres"],
            ];

            argArray.forEach((cmd) => console.info(easykube.runCommand(this.deployment, this.namespace, "psql", arguments)));

            if (schema != null) {
                schema.forEach((s) => console.info(
                    easykube.runCommand("postgres", "default", "psql", [
                        "-c", `create schema ${s}`, "-d", database, "-U", database
                    ])));
            }
        }

        return this;
    }

    /**
     * Applies a local sql script to a target database
     * @param {string} localSource Filename of your local SQL script, filename must be relative to the addon *.ek.js file
     * @param {string} targetDatabase The database in which to apply the SQL script
     * @return {Postgres}
     *
     */
    runLocalScript(localSource, targetDatabase) {
        const uuid = utils.newUUID();
        const cmd = "psql";
        const args = [
            "-v", "ON_ERROR_STOP=1",
            "-U", "postgres",
            "-h", "localhost",
            "-d", targetDatabase,
            "-f", `/tmp/${uuid}.sql`
        ];

        easykube.copyFile(this.deployment, this.namespace, "postgres", localSource, `/tmp/${uuid}.sql`)
        const out = easykube.runCommand(this.deployment, this.namespace, cmd, args);
        console.info(out)

        return this;
    }

    /**
     * Applies a SQL file found in Git to a target database
     * @param {string} repo repository name (including server path)
     * @param {string} path path within the repository to the file you wish to apply
     * @param {string} target the target database (must exist beforehand)
     * @returns {Postgres}
     */
    runGitScript(repo, path, target) {
        return this;
    }
}

const postgres = new Postgres();

// newline at end-of-file is needed
