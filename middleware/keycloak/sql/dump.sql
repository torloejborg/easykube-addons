--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Debian 16.8-1.pgdg120+1)
-- Dumped by pg_dump version 16.8 (Debian 16.8-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
4089d09b-4bf5-490b-9d4b-9508a0d723b9	\N	auth-cookie	cb748a80-a440-40dc-ba38-53857fbff49b	49227233-408c-4cf0-9d24-5d708d0e035d	2	10	f	\N	\N
26097b79-e058-4933-b1a0-ec22f6df6582	\N	auth-spnego	cb748a80-a440-40dc-ba38-53857fbff49b	49227233-408c-4cf0-9d24-5d708d0e035d	3	20	f	\N	\N
ee1f7ba5-d507-4c84-9cbe-7f80cb7a03d8	\N	identity-provider-redirector	cb748a80-a440-40dc-ba38-53857fbff49b	49227233-408c-4cf0-9d24-5d708d0e035d	2	25	f	\N	\N
ba2b28db-a8b1-4378-bc13-ee3eaec99452	\N	\N	cb748a80-a440-40dc-ba38-53857fbff49b	49227233-408c-4cf0-9d24-5d708d0e035d	2	30	t	b6ee89ff-1328-4073-90fb-e96a9f031658	\N
2bc08dc5-9717-457f-9f7d-9485dd66919b	\N	auth-username-password-form	cb748a80-a440-40dc-ba38-53857fbff49b	b6ee89ff-1328-4073-90fb-e96a9f031658	0	10	f	\N	\N
b22b1560-0552-42af-9626-3df838411d22	\N	\N	cb748a80-a440-40dc-ba38-53857fbff49b	b6ee89ff-1328-4073-90fb-e96a9f031658	1	20	t	ebc10513-fb3d-4109-afc7-21042bc96bbc	\N
0a21ec1d-fe34-4ef2-8034-cb9bb2a9683c	\N	conditional-user-configured	cb748a80-a440-40dc-ba38-53857fbff49b	ebc10513-fb3d-4109-afc7-21042bc96bbc	0	10	f	\N	\N
e50bc537-571f-47bb-8126-66072684468b	\N	auth-otp-form	cb748a80-a440-40dc-ba38-53857fbff49b	ebc10513-fb3d-4109-afc7-21042bc96bbc	0	20	f	\N	\N
09b27809-9b8e-4d5a-bada-40a48535b9b0	\N	direct-grant-validate-username	cb748a80-a440-40dc-ba38-53857fbff49b	386db045-3471-407a-b862-9e07f35d70e6	0	10	f	\N	\N
9c89b82a-d573-462b-8678-b458dddb330d	\N	direct-grant-validate-password	cb748a80-a440-40dc-ba38-53857fbff49b	386db045-3471-407a-b862-9e07f35d70e6	0	20	f	\N	\N
730c1ba6-79df-4af9-b6c6-5fd7a3ddfcd2	\N	\N	cb748a80-a440-40dc-ba38-53857fbff49b	386db045-3471-407a-b862-9e07f35d70e6	1	30	t	f040795c-87a7-49d7-b827-faedae2cdaa3	\N
8d882098-d724-4769-8ab4-e6203db83fe9	\N	conditional-user-configured	cb748a80-a440-40dc-ba38-53857fbff49b	f040795c-87a7-49d7-b827-faedae2cdaa3	0	10	f	\N	\N
9981b72a-9300-484f-8380-c91c865e190d	\N	direct-grant-validate-otp	cb748a80-a440-40dc-ba38-53857fbff49b	f040795c-87a7-49d7-b827-faedae2cdaa3	0	20	f	\N	\N
3f21c63f-301d-4a55-ab3b-79bcf43ac40f	\N	registration-page-form	cb748a80-a440-40dc-ba38-53857fbff49b	68bed145-2593-4c6f-b405-acc017cae06e	0	10	t	4a2293d4-41ba-4a96-9f2b-48a63bd424bf	\N
df7601f4-81aa-4c66-9704-3bf17c471bcb	\N	registration-user-creation	cb748a80-a440-40dc-ba38-53857fbff49b	4a2293d4-41ba-4a96-9f2b-48a63bd424bf	0	20	f	\N	\N
6c4aecec-d79a-42f2-bda2-b0da0d30fc59	\N	registration-profile-action	cb748a80-a440-40dc-ba38-53857fbff49b	4a2293d4-41ba-4a96-9f2b-48a63bd424bf	0	40	f	\N	\N
b632e01d-ed11-4f16-8f0a-11e9b40efa8a	\N	registration-password-action	cb748a80-a440-40dc-ba38-53857fbff49b	4a2293d4-41ba-4a96-9f2b-48a63bd424bf	0	50	f	\N	\N
5e3feb7c-4da6-4bbe-b96a-02a66386e4e5	\N	registration-recaptcha-action	cb748a80-a440-40dc-ba38-53857fbff49b	4a2293d4-41ba-4a96-9f2b-48a63bd424bf	3	60	f	\N	\N
adc05e08-6083-42de-a369-3860b8c5de01	\N	registration-terms-and-conditions	cb748a80-a440-40dc-ba38-53857fbff49b	4a2293d4-41ba-4a96-9f2b-48a63bd424bf	3	70	f	\N	\N
c34c047a-56c5-4e0f-b2b6-6e1d3ce1ea08	\N	reset-credentials-choose-user	cb748a80-a440-40dc-ba38-53857fbff49b	f0df8b26-3a15-4c1f-80ba-b61c5265c4a8	0	10	f	\N	\N
c41b5373-451e-49d8-a3cf-1c8b0c40483b	\N	reset-credential-email	cb748a80-a440-40dc-ba38-53857fbff49b	f0df8b26-3a15-4c1f-80ba-b61c5265c4a8	0	20	f	\N	\N
131cb011-9f37-4e27-a191-b7238a4fd493	\N	reset-password	cb748a80-a440-40dc-ba38-53857fbff49b	f0df8b26-3a15-4c1f-80ba-b61c5265c4a8	0	30	f	\N	\N
4e694f74-7264-4158-a445-c7516409bfbb	\N	\N	cb748a80-a440-40dc-ba38-53857fbff49b	f0df8b26-3a15-4c1f-80ba-b61c5265c4a8	1	40	t	80009717-1106-4dba-add9-2b5bff3023b6	\N
7c7c779b-5cb5-485b-8e3a-27c63d4a5767	\N	conditional-user-configured	cb748a80-a440-40dc-ba38-53857fbff49b	80009717-1106-4dba-add9-2b5bff3023b6	0	10	f	\N	\N
ffe55c0c-49c3-47b6-9ac4-abb4f84871b6	\N	reset-otp	cb748a80-a440-40dc-ba38-53857fbff49b	80009717-1106-4dba-add9-2b5bff3023b6	0	20	f	\N	\N
5fd7da87-31f6-4b1f-9693-d76ac47f48b8	\N	client-secret	cb748a80-a440-40dc-ba38-53857fbff49b	dc5106b9-7804-4644-ad29-fa251c88f86d	2	10	f	\N	\N
6bc746c0-63b9-4a5e-801e-f2960d5948be	\N	client-jwt	cb748a80-a440-40dc-ba38-53857fbff49b	dc5106b9-7804-4644-ad29-fa251c88f86d	2	20	f	\N	\N
8e3db67d-8f39-476b-84ef-585f8c20541e	\N	client-secret-jwt	cb748a80-a440-40dc-ba38-53857fbff49b	dc5106b9-7804-4644-ad29-fa251c88f86d	2	30	f	\N	\N
cef51fba-7435-4411-ac2a-fe5b9fa31055	\N	client-x509	cb748a80-a440-40dc-ba38-53857fbff49b	dc5106b9-7804-4644-ad29-fa251c88f86d	2	40	f	\N	\N
d3bd7d2a-48ac-42cf-a823-1cafc8860811	\N	idp-review-profile	cb748a80-a440-40dc-ba38-53857fbff49b	99c9c03e-4291-4cc4-b969-0601d7f112ff	0	10	f	\N	f19a953e-594a-47ad-bb48-ffe5f2d41c80
a5edd6bb-6608-4f11-9f89-89e46ea60e11	\N	\N	cb748a80-a440-40dc-ba38-53857fbff49b	99c9c03e-4291-4cc4-b969-0601d7f112ff	0	20	t	61415b78-c9a2-4fb0-9f25-00586fa7527d	\N
030a975e-376b-4db1-bc2a-e1752d2c0516	\N	idp-create-user-if-unique	cb748a80-a440-40dc-ba38-53857fbff49b	61415b78-c9a2-4fb0-9f25-00586fa7527d	2	10	f	\N	0bb403fa-edc1-4a5d-882d-087ea6d79db6
44340b17-638a-4320-ac59-d1609f92c471	\N	\N	cb748a80-a440-40dc-ba38-53857fbff49b	61415b78-c9a2-4fb0-9f25-00586fa7527d	2	20	t	01e42ca2-988a-42db-88ee-ceef1433235e	\N
b02a5a12-f970-4c67-9d29-284609790620	\N	idp-confirm-link	cb748a80-a440-40dc-ba38-53857fbff49b	01e42ca2-988a-42db-88ee-ceef1433235e	0	10	f	\N	\N
b4533b20-1159-41ef-bed8-7690b1acd610	\N	\N	cb748a80-a440-40dc-ba38-53857fbff49b	01e42ca2-988a-42db-88ee-ceef1433235e	0	20	t	5bc09f16-72fb-4c06-94ee-6b60244202e8	\N
346690d1-b0ed-4493-8484-46e3956626aa	\N	idp-email-verification	cb748a80-a440-40dc-ba38-53857fbff49b	5bc09f16-72fb-4c06-94ee-6b60244202e8	2	10	f	\N	\N
5ecdee3f-e237-479d-b160-941d2458ecde	\N	\N	cb748a80-a440-40dc-ba38-53857fbff49b	5bc09f16-72fb-4c06-94ee-6b60244202e8	2	20	t	49e4d9ad-b592-408c-87fb-53a97333cabb	\N
5dd0b853-e0f7-4c29-b4fc-8a3670f06fa2	\N	idp-username-password-form	cb748a80-a440-40dc-ba38-53857fbff49b	49e4d9ad-b592-408c-87fb-53a97333cabb	0	10	f	\N	\N
532ae87e-1caf-4bb7-ac2a-60f88ef4ae81	\N	\N	cb748a80-a440-40dc-ba38-53857fbff49b	49e4d9ad-b592-408c-87fb-53a97333cabb	1	20	t	062118ee-690c-49c8-9aea-95ca066392af	\N
38a5a574-b88e-483e-8fbf-57dced380c97	\N	conditional-user-configured	cb748a80-a440-40dc-ba38-53857fbff49b	062118ee-690c-49c8-9aea-95ca066392af	0	10	f	\N	\N
c2cae5bc-ba6b-4650-85fc-26bdac270c91	\N	auth-otp-form	cb748a80-a440-40dc-ba38-53857fbff49b	062118ee-690c-49c8-9aea-95ca066392af	0	20	f	\N	\N
43cf02d3-65c7-4739-a2f3-cce4f8365175	\N	http-basic-authenticator	cb748a80-a440-40dc-ba38-53857fbff49b	e0c2d4b3-5224-452d-868c-f536807b5195	0	10	f	\N	\N
cb2e206e-7bae-4e51-9522-bc18ab347150	\N	docker-http-basic-authenticator	cb748a80-a440-40dc-ba38-53857fbff49b	2916ed9c-0609-40a0-8021-c86b8c27f943	0	10	f	\N	\N
287808ff-8ee8-477d-8879-61bf9976cb6d	\N	auth-cookie	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	55cc45ae-3056-40d3-8d88-527450aec69f	2	10	f	\N	\N
b1430c05-9571-47b9-9bc3-da64db0d200e	\N	auth-spnego	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	55cc45ae-3056-40d3-8d88-527450aec69f	3	20	f	\N	\N
4339cbe1-93a6-4ccf-bc06-10c3d7ff65d0	\N	identity-provider-redirector	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	55cc45ae-3056-40d3-8d88-527450aec69f	2	25	f	\N	\N
5b49df9d-55ce-4c0a-8bb4-e582028c3879	\N	\N	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	55cc45ae-3056-40d3-8d88-527450aec69f	2	30	t	bd7c529d-4c45-421a-a24a-51cd4b7e7e92	\N
72a008f5-cc6d-49dd-b99c-524caef60891	\N	auth-username-password-form	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	bd7c529d-4c45-421a-a24a-51cd4b7e7e92	0	10	f	\N	\N
b5997ed2-26b9-439d-8107-42ad341fa703	\N	\N	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	bd7c529d-4c45-421a-a24a-51cd4b7e7e92	1	20	t	87ecdc46-39a8-45c4-954b-ef9eb490b2cc	\N
c86224b8-899d-43f7-a75f-957415f052af	\N	conditional-user-configured	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	87ecdc46-39a8-45c4-954b-ef9eb490b2cc	0	10	f	\N	\N
a2170f14-94f3-44c4-8fbc-68c5f50726c2	\N	auth-otp-form	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	87ecdc46-39a8-45c4-954b-ef9eb490b2cc	0	20	f	\N	\N
7313b596-8325-4de7-be93-3a7dca26167b	\N	direct-grant-validate-username	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	04d623a2-81bb-4103-a28a-1df5745dae61	0	10	f	\N	\N
fe330d5f-3428-45e4-8327-5a4b44de93eb	\N	direct-grant-validate-password	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	04d623a2-81bb-4103-a28a-1df5745dae61	0	20	f	\N	\N
f6a219c3-0ab5-4873-9c4d-2307a996f048	\N	\N	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	04d623a2-81bb-4103-a28a-1df5745dae61	1	30	t	5029614b-8469-44a9-8097-dc4cc60ac658	\N
2548787d-da3d-4dfe-be11-39e3c412a17c	\N	conditional-user-configured	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	5029614b-8469-44a9-8097-dc4cc60ac658	0	10	f	\N	\N
37504746-dd76-4802-9668-bf934f7c4fe0	\N	direct-grant-validate-otp	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	5029614b-8469-44a9-8097-dc4cc60ac658	0	20	f	\N	\N
506f1a76-2e46-4ca2-816f-56804f5aff88	\N	registration-page-form	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	289ae116-a600-47d3-b229-4d3ce62668c0	0	10	t	3e54f555-22e1-48c1-b7a0-20094a708c44	\N
2bbaedc9-6c4b-46a1-9724-98dc6530f5c0	\N	registration-user-creation	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	3e54f555-22e1-48c1-b7a0-20094a708c44	0	20	f	\N	\N
cd26f4ed-5878-4a6a-81ca-a193f4cfe8a2	\N	registration-profile-action	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	3e54f555-22e1-48c1-b7a0-20094a708c44	0	40	f	\N	\N
833b4392-f3ec-4ccf-b80b-c180db9bd958	\N	registration-password-action	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	3e54f555-22e1-48c1-b7a0-20094a708c44	0	50	f	\N	\N
cb7d0864-9b59-4ee6-b20b-b0ee2368e791	\N	registration-recaptcha-action	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	3e54f555-22e1-48c1-b7a0-20094a708c44	3	60	f	\N	\N
b8410958-7c5c-442f-aa0a-9da1f4855eff	\N	reset-credentials-choose-user	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	83a80a27-b49e-4b50-809f-187b24adb249	0	10	f	\N	\N
c1abde79-f814-4523-9103-5284f6042056	\N	reset-credential-email	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	83a80a27-b49e-4b50-809f-187b24adb249	0	20	f	\N	\N
06ad2f0d-3c0e-4c01-bbcb-25b50d52d327	\N	reset-password	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	83a80a27-b49e-4b50-809f-187b24adb249	0	30	f	\N	\N
75fd8d55-313b-483d-b850-47adcb411a23	\N	\N	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	83a80a27-b49e-4b50-809f-187b24adb249	1	40	t	22289641-369b-4cf7-96a7-b23a4bb956ac	\N
d2c66160-f6e8-4e21-8f74-7c800c3b94f7	\N	conditional-user-configured	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	22289641-369b-4cf7-96a7-b23a4bb956ac	0	10	f	\N	\N
9120bb5d-14b4-40cc-8b82-a7e226760e1d	\N	reset-otp	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	22289641-369b-4cf7-96a7-b23a4bb956ac	0	20	f	\N	\N
199b8d00-13a9-4600-92c7-70d88ec8e1c0	\N	client-secret	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	d5ba03b1-55dc-4165-abf6-5024141610f1	2	10	f	\N	\N
842cc3f9-3c80-4572-988a-f34649842940	\N	client-jwt	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	d5ba03b1-55dc-4165-abf6-5024141610f1	2	20	f	\N	\N
e58ba0e9-663f-4b85-8888-0e5a423812d5	\N	client-secret-jwt	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	d5ba03b1-55dc-4165-abf6-5024141610f1	2	30	f	\N	\N
7ee03b86-57dd-438d-b67b-16067103bbe8	\N	client-x509	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	d5ba03b1-55dc-4165-abf6-5024141610f1	2	40	f	\N	\N
fc4721e8-3bee-4e44-a9b9-026bd7ed1e57	\N	idp-review-profile	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	02bd0519-6768-404a-9fdd-b0990986c53e	0	10	f	\N	c0c4de44-f8f8-4656-a2b3-fff0798b307e
572cb691-2c86-4eb6-8920-ffbd655bf09c	\N	\N	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	02bd0519-6768-404a-9fdd-b0990986c53e	0	20	t	04c55feb-77a6-49e7-9214-7dfd6d49851f	\N
88739db6-0f46-4453-863d-2c4634fa12cc	\N	idp-create-user-if-unique	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	04c55feb-77a6-49e7-9214-7dfd6d49851f	2	10	f	\N	3faee87e-2793-4a05-b08b-197f508e5b7e
f733338f-3f71-41e6-b0e3-f62adfc4cef0	\N	\N	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	04c55feb-77a6-49e7-9214-7dfd6d49851f	2	20	t	4f613cf2-cd20-4549-9198-6aa95063c474	\N
e6ae5030-6fd1-43c8-901c-983a8b1bf489	\N	idp-confirm-link	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	4f613cf2-cd20-4549-9198-6aa95063c474	0	10	f	\N	\N
232d5bc0-4e3d-4bb4-8709-16c6ef9c05ac	\N	\N	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	4f613cf2-cd20-4549-9198-6aa95063c474	0	20	t	2e0c617d-ba58-412c-92b8-ba999e883d34	\N
549cfae2-854d-41e8-b948-058c0e6d8c37	\N	idp-email-verification	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	2e0c617d-ba58-412c-92b8-ba999e883d34	2	10	f	\N	\N
464ec258-b8eb-488c-b256-c4a470693ff9	\N	\N	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	2e0c617d-ba58-412c-92b8-ba999e883d34	2	20	t	c465aa08-4a6d-4fca-8d1a-c1d0e1f33918	\N
01e5147d-793f-43d9-8360-804549a5da9b	\N	idp-username-password-form	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c465aa08-4a6d-4fca-8d1a-c1d0e1f33918	0	10	f	\N	\N
13ed4293-f25b-4c08-b7fc-1df9ab9bd607	\N	\N	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c465aa08-4a6d-4fca-8d1a-c1d0e1f33918	1	20	t	7c3d2d90-4e71-4a19-9541-1e0ad96458ba	\N
21b69113-96b0-4d8f-9e4b-f74a61c819eb	\N	conditional-user-configured	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	7c3d2d90-4e71-4a19-9541-1e0ad96458ba	0	10	f	\N	\N
3d7da1e8-8019-494c-aba0-922ca44ed3b0	\N	auth-otp-form	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	7c3d2d90-4e71-4a19-9541-1e0ad96458ba	0	20	f	\N	\N
a772d3aa-12ce-4083-bd40-63cae163acad	\N	http-basic-authenticator	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	d5a7fcd0-ba64-49ae-a5e4-d9d06a9feff0	0	10	f	\N	\N
7abe47a7-b010-4ccd-b1bd-5f9ecff0c5d0	\N	docker-http-basic-authenticator	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	553327f1-94cc-4588-84f1-1e6895067fd0	0	10	f	\N	\N
c5982b7a-1c98-4f68-9719-c12d6ed64842	\N	auth-cookie	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	c0ec2fa0-773d-4cdf-bdf9-92d562839ecd	2	10	f	\N	\N
62f74a5b-be18-42b0-b189-0c86c910b121	\N	auth-spnego	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	c0ec2fa0-773d-4cdf-bdf9-92d562839ecd	3	20	f	\N	\N
4488a7ad-48d2-4409-9fb1-93db70d6a099	\N	identity-provider-redirector	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	c0ec2fa0-773d-4cdf-bdf9-92d562839ecd	2	25	f	\N	\N
12005fed-c957-4a01-a1f1-12e961b92156	\N	\N	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	c0ec2fa0-773d-4cdf-bdf9-92d562839ecd	2	30	t	921d2a28-c722-4cd4-a957-58a245ff9ee2	\N
cce3bdb8-aab0-46a8-9774-c28d882efb08	\N	auth-username-password-form	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	921d2a28-c722-4cd4-a957-58a245ff9ee2	0	10	f	\N	\N
4eae2354-182d-49a2-bcd7-609e8605ed8b	\N	\N	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	921d2a28-c722-4cd4-a957-58a245ff9ee2	1	20	t	04636ce8-b5a8-4676-950c-19b1b0fe8289	\N
71108d24-c0b3-4066-90a3-4c049bded3bf	\N	conditional-user-configured	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	04636ce8-b5a8-4676-950c-19b1b0fe8289	0	10	f	\N	\N
f4749631-892c-4f94-8f99-a6f43bfc4b24	\N	auth-otp-form	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	04636ce8-b5a8-4676-950c-19b1b0fe8289	0	20	f	\N	\N
b69edab7-1e17-4959-8b24-cb543015fa0d	\N	direct-grant-validate-username	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	4b9d1e39-7aee-4e32-aae8-f448bf4e02af	0	10	f	\N	\N
53c9823a-29ce-46bc-a288-0cd995506694	\N	direct-grant-validate-password	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	4b9d1e39-7aee-4e32-aae8-f448bf4e02af	0	20	f	\N	\N
63c89f6c-3a00-4a75-8cad-8ac9be758b66	\N	\N	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	4b9d1e39-7aee-4e32-aae8-f448bf4e02af	1	30	t	4977a260-1da3-4245-979a-5ae629a50c3a	\N
f1d8b4e6-5828-438f-80d4-2a10a6180801	\N	conditional-user-configured	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	4977a260-1da3-4245-979a-5ae629a50c3a	0	10	f	\N	\N
fce906fd-9a2d-4fbb-aef2-1ae93c94dfc1	\N	direct-grant-validate-otp	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	4977a260-1da3-4245-979a-5ae629a50c3a	0	20	f	\N	\N
7e802771-6d8b-440d-aeb0-f1fc59d0e718	\N	registration-page-form	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	dd5b2f2d-f7d4-475c-85b5-4ab0a249eba3	0	10	t	80942386-af07-4906-b11f-b4f04549f26e	\N
ff84b08e-5708-49d7-88c2-81b00cdf489c	\N	registration-user-creation	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	80942386-af07-4906-b11f-b4f04549f26e	0	20	f	\N	\N
949e3982-9a37-47a3-a138-f70eb6ad047e	\N	registration-profile-action	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	80942386-af07-4906-b11f-b4f04549f26e	0	40	f	\N	\N
6e08010b-53f3-4503-bd8b-a1574384f2d8	\N	registration-password-action	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	80942386-af07-4906-b11f-b4f04549f26e	0	50	f	\N	\N
c06aa040-c630-4f56-8155-42d63e965f83	\N	registration-recaptcha-action	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	80942386-af07-4906-b11f-b4f04549f26e	3	60	f	\N	\N
93b7e106-ac59-4d69-ad09-333c7e5efbc4	\N	reset-credentials-choose-user	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ad61aa7d-ab88-42f6-b9c9-16eda785c66d	0	10	f	\N	\N
12b7e366-a582-4df9-b7d3-4dbaf6033b03	\N	reset-credential-email	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ad61aa7d-ab88-42f6-b9c9-16eda785c66d	0	20	f	\N	\N
a0ca7b4e-ea6d-4f57-8957-ee635205f2b2	\N	reset-password	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ad61aa7d-ab88-42f6-b9c9-16eda785c66d	0	30	f	\N	\N
f83a1f6c-10b5-4878-ab8a-f1f2b62c4e26	\N	\N	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ad61aa7d-ab88-42f6-b9c9-16eda785c66d	1	40	t	bacfcc2b-d63b-4ddc-9f0c-3f96c5083742	\N
cc65c431-c7b4-4569-b300-acd51d82a46e	\N	conditional-user-configured	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	bacfcc2b-d63b-4ddc-9f0c-3f96c5083742	0	10	f	\N	\N
cb9a36b4-c3ff-4d62-a520-3740ff93743c	\N	reset-otp	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	bacfcc2b-d63b-4ddc-9f0c-3f96c5083742	0	20	f	\N	\N
e2c03a6b-01bb-44c5-8d53-b116a3c1fb16	\N	client-secret	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	757eef86-90b5-48f7-9a07-ac5d509717bd	2	10	f	\N	\N
03dcc17c-dc3c-4a86-a84a-3c059a09b413	\N	client-jwt	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	757eef86-90b5-48f7-9a07-ac5d509717bd	2	20	f	\N	\N
23fd402f-fc2a-4524-9248-35169006a6cc	\N	client-secret-jwt	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	757eef86-90b5-48f7-9a07-ac5d509717bd	2	30	f	\N	\N
4529344d-09a2-4484-bcc0-0a752d39a4e8	\N	client-x509	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	757eef86-90b5-48f7-9a07-ac5d509717bd	2	40	f	\N	\N
7db50fdb-2a88-432e-bf2b-0b871c3d1f82	\N	idp-review-profile	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	feef2d84-323b-491e-95ed-ba665e99dc5d	0	10	f	\N	93dff954-cba6-4c3d-94f3-aa76b46c7e10
07fe2ae4-39f5-41be-9a2a-2a5a52794f3a	\N	\N	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	feef2d84-323b-491e-95ed-ba665e99dc5d	0	20	t	b7d09621-e95a-4858-8053-c40042b768eb	\N
2685927a-6244-4a27-8c66-3fd284a8688b	\N	idp-create-user-if-unique	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	b7d09621-e95a-4858-8053-c40042b768eb	2	10	f	\N	0bd6d4f2-a895-4c6d-b3ae-c239d75c6307
8724ab9a-eb8b-47ae-8fdb-852931d290b3	\N	\N	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	b7d09621-e95a-4858-8053-c40042b768eb	2	20	t	7663df1e-0d74-4496-945d-c926b9465e37	\N
e12b9425-12d7-406e-9941-6734bcb693ac	\N	idp-confirm-link	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	7663df1e-0d74-4496-945d-c926b9465e37	0	10	f	\N	\N
60c8b621-0112-4a7a-a9c8-9bdfa8c92214	\N	\N	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	7663df1e-0d74-4496-945d-c926b9465e37	0	20	t	deab3a22-2bbc-495a-9efb-f4887bfcf1ce	\N
a834d8da-143e-4645-b777-717c0ff73334	\N	idp-email-verification	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	deab3a22-2bbc-495a-9efb-f4887bfcf1ce	2	10	f	\N	\N
f2c15e41-8c5e-40e7-bf09-f972a5f14e1e	\N	\N	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	deab3a22-2bbc-495a-9efb-f4887bfcf1ce	2	20	t	d5907570-cdf5-45a1-aff9-1b6245901922	\N
9e146e61-12c5-481e-88a4-0eaa3db7e7d7	\N	idp-username-password-form	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	d5907570-cdf5-45a1-aff9-1b6245901922	0	10	f	\N	\N
dac6b806-fb17-48c9-902d-d74d7f442605	\N	\N	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	d5907570-cdf5-45a1-aff9-1b6245901922	1	20	t	bd17ddf9-639a-4b2d-84d5-796a5fe9b4be	\N
bb06dd4d-278c-4e5e-b851-467c3a2d50ad	\N	conditional-user-configured	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	bd17ddf9-639a-4b2d-84d5-796a5fe9b4be	0	10	f	\N	\N
773f4540-d44f-4ef3-a56e-6a00b8d7994c	\N	auth-otp-form	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	bd17ddf9-639a-4b2d-84d5-796a5fe9b4be	0	20	f	\N	\N
c0485042-4b64-4d26-b001-6bafab8f3510	\N	http-basic-authenticator	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	72f790e0-4f1a-4868-abf0-c1415433fa6b	0	10	f	\N	\N
c7f3045a-78cc-4c4a-b44a-d417a46b14c3	\N	docker-http-basic-authenticator	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ccf57df5-d56c-4a60-aadb-a062c0a92bc5	0	10	f	\N	\N
9f418b70-f29b-4089-8b5a-ba200e14db9d	\N	auth-cookie	e8cfaa41-db82-4979-8f75-429ff43b53b9	e58ed25f-452d-4738-9e1f-bd4c6f5d7ce3	2	10	f	\N	\N
3d823296-d8d5-4d1b-ad88-e9d592556628	\N	auth-spnego	e8cfaa41-db82-4979-8f75-429ff43b53b9	e58ed25f-452d-4738-9e1f-bd4c6f5d7ce3	3	20	f	\N	\N
0b0f844c-0e03-4354-bd9b-0f2494e8403d	\N	identity-provider-redirector	e8cfaa41-db82-4979-8f75-429ff43b53b9	e58ed25f-452d-4738-9e1f-bd4c6f5d7ce3	2	25	f	\N	\N
dc591f8d-b13f-4f12-bbc1-f0a2368eaf76	\N	\N	e8cfaa41-db82-4979-8f75-429ff43b53b9	e58ed25f-452d-4738-9e1f-bd4c6f5d7ce3	2	30	t	4c0dbb01-cc83-44a0-9bc2-e568a61d1a9a	\N
fe7eadb5-05f5-4f58-8072-139d696aabfd	\N	auth-username-password-form	e8cfaa41-db82-4979-8f75-429ff43b53b9	4c0dbb01-cc83-44a0-9bc2-e568a61d1a9a	0	10	f	\N	\N
9621006a-c2cf-43cc-9009-0198285a31d6	\N	\N	e8cfaa41-db82-4979-8f75-429ff43b53b9	4c0dbb01-cc83-44a0-9bc2-e568a61d1a9a	1	20	t	3ea28b43-c065-4f78-aa96-cdde31fd2974	\N
4466e66b-aa7b-4a9d-b8db-b907fd7671c0	\N	conditional-user-configured	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ea28b43-c065-4f78-aa96-cdde31fd2974	0	10	f	\N	\N
716eb7d6-9db2-4211-bea5-718510d0cd4f	\N	auth-otp-form	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ea28b43-c065-4f78-aa96-cdde31fd2974	0	20	f	\N	\N
7212ae3b-79d4-497a-935a-325a611428d3	\N	direct-grant-validate-username	e8cfaa41-db82-4979-8f75-429ff43b53b9	519a23cc-1e49-4561-8275-ab1c11facb52	0	10	f	\N	\N
ec7f3dd9-f878-49a3-8493-6afec289d5fc	\N	direct-grant-validate-password	e8cfaa41-db82-4979-8f75-429ff43b53b9	519a23cc-1e49-4561-8275-ab1c11facb52	0	20	f	\N	\N
3d3938f3-eefb-4656-adb7-1ce5484e8340	\N	\N	e8cfaa41-db82-4979-8f75-429ff43b53b9	519a23cc-1e49-4561-8275-ab1c11facb52	1	30	t	b559df69-ea8c-40d4-9e1b-1ac82460c54c	\N
79551878-c125-4b44-81f5-41fcb18108fc	\N	conditional-user-configured	e8cfaa41-db82-4979-8f75-429ff43b53b9	b559df69-ea8c-40d4-9e1b-1ac82460c54c	0	10	f	\N	\N
ab8d8685-7cb3-4065-9bb6-c915ab7581fd	\N	direct-grant-validate-otp	e8cfaa41-db82-4979-8f75-429ff43b53b9	b559df69-ea8c-40d4-9e1b-1ac82460c54c	0	20	f	\N	\N
fdd0a752-1694-450f-9c32-f9918cbf7772	\N	registration-page-form	e8cfaa41-db82-4979-8f75-429ff43b53b9	9b850c97-414c-425c-913a-800bdd4afcc4	0	10	t	e84873dc-cf8e-4909-89f7-88c2b7cdb5d5	\N
4738aa3b-2298-48c7-a7ff-212071b6c676	\N	registration-user-creation	e8cfaa41-db82-4979-8f75-429ff43b53b9	e84873dc-cf8e-4909-89f7-88c2b7cdb5d5	0	20	f	\N	\N
86d9a809-f096-4727-a201-125aeb2bd921	\N	registration-profile-action	e8cfaa41-db82-4979-8f75-429ff43b53b9	e84873dc-cf8e-4909-89f7-88c2b7cdb5d5	0	40	f	\N	\N
1413cc3f-a5a2-413a-bccc-1f2b3f76241e	\N	registration-password-action	e8cfaa41-db82-4979-8f75-429ff43b53b9	e84873dc-cf8e-4909-89f7-88c2b7cdb5d5	0	50	f	\N	\N
1e3f23f8-b08b-4515-a6d6-586a8fa9e699	\N	registration-recaptcha-action	e8cfaa41-db82-4979-8f75-429ff43b53b9	e84873dc-cf8e-4909-89f7-88c2b7cdb5d5	3	60	f	\N	\N
47b81067-d5eb-46ce-a80f-c1dc55281d12	\N	reset-credentials-choose-user	e8cfaa41-db82-4979-8f75-429ff43b53b9	c65a5c59-146b-4c17-bce9-5cfe6bca1c2f	0	10	f	\N	\N
83c3bc5e-4dd3-4b44-8b35-e7bd325797e9	\N	reset-credential-email	e8cfaa41-db82-4979-8f75-429ff43b53b9	c65a5c59-146b-4c17-bce9-5cfe6bca1c2f	0	20	f	\N	\N
7a46e717-a446-4b2e-8dce-a089a33e10a3	\N	reset-password	e8cfaa41-db82-4979-8f75-429ff43b53b9	c65a5c59-146b-4c17-bce9-5cfe6bca1c2f	0	30	f	\N	\N
5f5517fc-3e17-483d-aff6-9f43f07480c5	\N	\N	e8cfaa41-db82-4979-8f75-429ff43b53b9	c65a5c59-146b-4c17-bce9-5cfe6bca1c2f	1	40	t	ccab74fd-d9ff-48bb-b6da-7ae057dbba6f	\N
8f77cb01-7e9b-4942-b642-1b118d4faba3	\N	conditional-user-configured	e8cfaa41-db82-4979-8f75-429ff43b53b9	ccab74fd-d9ff-48bb-b6da-7ae057dbba6f	0	10	f	\N	\N
eabf8e30-2109-4248-a8f7-1ff05f6a7c7a	\N	reset-otp	e8cfaa41-db82-4979-8f75-429ff43b53b9	ccab74fd-d9ff-48bb-b6da-7ae057dbba6f	0	20	f	\N	\N
d41612cf-9bcf-4ad5-ba2e-b02fe227b50e	\N	client-secret	e8cfaa41-db82-4979-8f75-429ff43b53b9	9a2919b1-b109-4817-8549-a3741f84296d	2	10	f	\N	\N
21d7847f-ec71-4881-a360-4dab74301093	\N	client-jwt	e8cfaa41-db82-4979-8f75-429ff43b53b9	9a2919b1-b109-4817-8549-a3741f84296d	2	20	f	\N	\N
bdfce347-abf8-4e1a-9305-1767c85608b6	\N	client-secret-jwt	e8cfaa41-db82-4979-8f75-429ff43b53b9	9a2919b1-b109-4817-8549-a3741f84296d	2	30	f	\N	\N
e2f2a510-7a03-4ff7-bd6f-88626261258b	\N	client-x509	e8cfaa41-db82-4979-8f75-429ff43b53b9	9a2919b1-b109-4817-8549-a3741f84296d	2	40	f	\N	\N
4361c548-6cd0-4964-8e90-25570cb6b28e	\N	idp-review-profile	e8cfaa41-db82-4979-8f75-429ff43b53b9	41b7dcfc-d55c-4985-b64a-aace3227e7d4	0	10	f	\N	6426e1af-83ac-43c7-a051-6f7e22788f34
6eb9167f-1a46-4aad-aa74-9a889a09f1a8	\N	\N	e8cfaa41-db82-4979-8f75-429ff43b53b9	41b7dcfc-d55c-4985-b64a-aace3227e7d4	0	20	t	ac11037e-c049-439b-a3c1-c8b1d05427d4	\N
8c043e6b-b278-4344-9985-59dcd9134553	\N	idp-create-user-if-unique	e8cfaa41-db82-4979-8f75-429ff43b53b9	ac11037e-c049-439b-a3c1-c8b1d05427d4	2	10	f	\N	4769387d-c193-401b-913a-494e58d0524a
bfb0708a-37ea-4dc6-bcbc-d9e2e9d910bf	\N	\N	e8cfaa41-db82-4979-8f75-429ff43b53b9	ac11037e-c049-439b-a3c1-c8b1d05427d4	2	20	t	96ea03d4-43a2-4321-9075-85dba875e409	\N
073c0d72-0130-4a21-8a3f-975bc378c2ef	\N	idp-confirm-link	e8cfaa41-db82-4979-8f75-429ff43b53b9	96ea03d4-43a2-4321-9075-85dba875e409	0	10	f	\N	\N
35a44625-aa74-4b7f-a447-854f8cc8417b	\N	\N	e8cfaa41-db82-4979-8f75-429ff43b53b9	96ea03d4-43a2-4321-9075-85dba875e409	0	20	t	83d7ffc4-3b0e-48d4-af1e-5bfca42a8675	\N
b267ed5c-92cf-4910-b562-cb3221c06358	\N	idp-email-verification	e8cfaa41-db82-4979-8f75-429ff43b53b9	83d7ffc4-3b0e-48d4-af1e-5bfca42a8675	2	10	f	\N	\N
a70c1777-d3bc-4dc6-8c56-31981ed38511	\N	\N	e8cfaa41-db82-4979-8f75-429ff43b53b9	83d7ffc4-3b0e-48d4-af1e-5bfca42a8675	2	20	t	8b256bec-ecdf-421a-a1aa-f68db47d1281	\N
220a073f-5613-4624-8dd0-7e48a786ab44	\N	idp-username-password-form	e8cfaa41-db82-4979-8f75-429ff43b53b9	8b256bec-ecdf-421a-a1aa-f68db47d1281	0	10	f	\N	\N
b7b9149a-b081-46ac-94a7-b4dda7317bb9	\N	\N	e8cfaa41-db82-4979-8f75-429ff43b53b9	8b256bec-ecdf-421a-a1aa-f68db47d1281	1	20	t	f2c8ba52-35a1-4006-a790-c3cd979aa052	\N
f034e799-cbc3-4688-82dd-23b483673924	\N	conditional-user-configured	e8cfaa41-db82-4979-8f75-429ff43b53b9	f2c8ba52-35a1-4006-a790-c3cd979aa052	0	10	f	\N	\N
cc4df1de-2c0c-4f3e-8a1b-b17ed23a793e	\N	auth-otp-form	e8cfaa41-db82-4979-8f75-429ff43b53b9	f2c8ba52-35a1-4006-a790-c3cd979aa052	0	20	f	\N	\N
87565d77-fbaf-41ee-9f9b-babcece6e488	\N	http-basic-authenticator	e8cfaa41-db82-4979-8f75-429ff43b53b9	8799a9a9-9745-41f5-bfdf-2efd80b55cf8	0	10	f	\N	\N
39865a19-899f-4fbb-a15a-f8306fe93fd9	\N	docker-http-basic-authenticator	e8cfaa41-db82-4979-8f75-429ff43b53b9	063c819a-f387-4701-acf8-1d4e6ba2742a	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
49227233-408c-4cf0-9d24-5d708d0e035d	browser	browser based authentication	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	t	t
b6ee89ff-1328-4073-90fb-e96a9f031658	forms	Username, password, otp and other auth forms.	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	f	t
ebc10513-fb3d-4109-afc7-21042bc96bbc	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	f	t
386db045-3471-407a-b862-9e07f35d70e6	direct grant	OpenID Connect Resource Owner Grant	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	t	t
f040795c-87a7-49d7-b827-faedae2cdaa3	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	f	t
68bed145-2593-4c6f-b405-acc017cae06e	registration	registration flow	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	t	t
4a2293d4-41ba-4a96-9f2b-48a63bd424bf	registration form	registration form	cb748a80-a440-40dc-ba38-53857fbff49b	form-flow	f	t
f0df8b26-3a15-4c1f-80ba-b61c5265c4a8	reset credentials	Reset credentials for a user if they forgot their password or something	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	t	t
80009717-1106-4dba-add9-2b5bff3023b6	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	f	t
dc5106b9-7804-4644-ad29-fa251c88f86d	clients	Base authentication for clients	cb748a80-a440-40dc-ba38-53857fbff49b	client-flow	t	t
99c9c03e-4291-4cc4-b969-0601d7f112ff	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	t	t
61415b78-c9a2-4fb0-9f25-00586fa7527d	User creation or linking	Flow for the existing/non-existing user alternatives	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	f	t
01e42ca2-988a-42db-88ee-ceef1433235e	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	f	t
5bc09f16-72fb-4c06-94ee-6b60244202e8	Account verification options	Method with which to verity the existing account	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	f	t
49e4d9ad-b592-408c-87fb-53a97333cabb	Verify Existing Account by Re-authentication	Reauthentication of existing account	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	f	t
062118ee-690c-49c8-9aea-95ca066392af	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	f	t
e0c2d4b3-5224-452d-868c-f536807b5195	saml ecp	SAML ECP Profile Authentication Flow	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	t	t
2916ed9c-0609-40a0-8021-c86b8c27f943	docker auth	Used by Docker clients to authenticate against the IDP	cb748a80-a440-40dc-ba38-53857fbff49b	basic-flow	t	t
55cc45ae-3056-40d3-8d88-527450aec69f	browser	browser based authentication	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	t	t
bd7c529d-4c45-421a-a24a-51cd4b7e7e92	forms	Username, password, otp and other auth forms.	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	f	t
87ecdc46-39a8-45c4-954b-ef9eb490b2cc	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	f	t
04d623a2-81bb-4103-a28a-1df5745dae61	direct grant	OpenID Connect Resource Owner Grant	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	t	t
5029614b-8469-44a9-8097-dc4cc60ac658	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	f	t
289ae116-a600-47d3-b229-4d3ce62668c0	registration	registration flow	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	t	t
3e54f555-22e1-48c1-b7a0-20094a708c44	registration form	registration form	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	form-flow	f	t
83a80a27-b49e-4b50-809f-187b24adb249	reset credentials	Reset credentials for a user if they forgot their password or something	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	t	t
22289641-369b-4cf7-96a7-b23a4bb956ac	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	f	t
d5ba03b1-55dc-4165-abf6-5024141610f1	clients	Base authentication for clients	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	client-flow	t	t
02bd0519-6768-404a-9fdd-b0990986c53e	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	t	t
04c55feb-77a6-49e7-9214-7dfd6d49851f	User creation or linking	Flow for the existing/non-existing user alternatives	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	f	t
4f613cf2-cd20-4549-9198-6aa95063c474	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	f	t
2e0c617d-ba58-412c-92b8-ba999e883d34	Account verification options	Method with which to verity the existing account	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	f	t
c465aa08-4a6d-4fca-8d1a-c1d0e1f33918	Verify Existing Account by Re-authentication	Reauthentication of existing account	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	f	t
7c3d2d90-4e71-4a19-9541-1e0ad96458ba	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	f	t
d5a7fcd0-ba64-49ae-a5e4-d9d06a9feff0	saml ecp	SAML ECP Profile Authentication Flow	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	t	t
553327f1-94cc-4588-84f1-1e6895067fd0	docker auth	Used by Docker clients to authenticate against the IDP	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	basic-flow	t	t
c0ec2fa0-773d-4cdf-bdf9-92d562839ecd	browser	browser based authentication	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	t	t
921d2a28-c722-4cd4-a957-58a245ff9ee2	forms	Username, password, otp and other auth forms.	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	f	t
04636ce8-b5a8-4676-950c-19b1b0fe8289	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	f	t
4b9d1e39-7aee-4e32-aae8-f448bf4e02af	direct grant	OpenID Connect Resource Owner Grant	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	t	t
4977a260-1da3-4245-979a-5ae629a50c3a	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	f	t
dd5b2f2d-f7d4-475c-85b5-4ab0a249eba3	registration	registration flow	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	t	t
80942386-af07-4906-b11f-b4f04549f26e	registration form	registration form	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	form-flow	f	t
ad61aa7d-ab88-42f6-b9c9-16eda785c66d	reset credentials	Reset credentials for a user if they forgot their password or something	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	t	t
bacfcc2b-d63b-4ddc-9f0c-3f96c5083742	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	f	t
757eef86-90b5-48f7-9a07-ac5d509717bd	clients	Base authentication for clients	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	client-flow	t	t
feef2d84-323b-491e-95ed-ba665e99dc5d	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	t	t
b7d09621-e95a-4858-8053-c40042b768eb	User creation or linking	Flow for the existing/non-existing user alternatives	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	f	t
7663df1e-0d74-4496-945d-c926b9465e37	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	f	t
deab3a22-2bbc-495a-9efb-f4887bfcf1ce	Account verification options	Method with which to verity the existing account	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	f	t
d5907570-cdf5-45a1-aff9-1b6245901922	Verify Existing Account by Re-authentication	Reauthentication of existing account	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	f	t
bd17ddf9-639a-4b2d-84d5-796a5fe9b4be	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	f	t
72f790e0-4f1a-4868-abf0-c1415433fa6b	saml ecp	SAML ECP Profile Authentication Flow	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	t	t
ccf57df5-d56c-4a60-aadb-a062c0a92bc5	docker auth	Used by Docker clients to authenticate against the IDP	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	basic-flow	t	t
e58ed25f-452d-4738-9e1f-bd4c6f5d7ce3	browser	browser based authentication	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	t	t
4c0dbb01-cc83-44a0-9bc2-e568a61d1a9a	forms	Username, password, otp and other auth forms.	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	f	t
3ea28b43-c065-4f78-aa96-cdde31fd2974	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	f	t
519a23cc-1e49-4561-8275-ab1c11facb52	direct grant	OpenID Connect Resource Owner Grant	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	t	t
b559df69-ea8c-40d4-9e1b-1ac82460c54c	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	f	t
9b850c97-414c-425c-913a-800bdd4afcc4	registration	registration flow	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	t	t
e84873dc-cf8e-4909-89f7-88c2b7cdb5d5	registration form	registration form	e8cfaa41-db82-4979-8f75-429ff43b53b9	form-flow	f	t
c65a5c59-146b-4c17-bce9-5cfe6bca1c2f	reset credentials	Reset credentials for a user if they forgot their password or something	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	t	t
ccab74fd-d9ff-48bb-b6da-7ae057dbba6f	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	f	t
9a2919b1-b109-4817-8549-a3741f84296d	clients	Base authentication for clients	e8cfaa41-db82-4979-8f75-429ff43b53b9	client-flow	t	t
41b7dcfc-d55c-4985-b64a-aace3227e7d4	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	t	t
ac11037e-c049-439b-a3c1-c8b1d05427d4	User creation or linking	Flow for the existing/non-existing user alternatives	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	f	t
96ea03d4-43a2-4321-9075-85dba875e409	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	f	t
83d7ffc4-3b0e-48d4-af1e-5bfca42a8675	Account verification options	Method with which to verity the existing account	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	f	t
8b256bec-ecdf-421a-a1aa-f68db47d1281	Verify Existing Account by Re-authentication	Reauthentication of existing account	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	f	t
f2c8ba52-35a1-4006-a790-c3cd979aa052	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	f	t
8799a9a9-9745-41f5-bfdf-2efd80b55cf8	saml ecp	SAML ECP Profile Authentication Flow	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	t	t
063c819a-f387-4701-acf8-1d4e6ba2742a	docker auth	Used by Docker clients to authenticate against the IDP	e8cfaa41-db82-4979-8f75-429ff43b53b9	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
f19a953e-594a-47ad-bb48-ffe5f2d41c80	review profile config	cb748a80-a440-40dc-ba38-53857fbff49b
0bb403fa-edc1-4a5d-882d-087ea6d79db6	create unique user config	cb748a80-a440-40dc-ba38-53857fbff49b
c0c4de44-f8f8-4656-a2b3-fff0798b307e	review profile config	c3ee8ea6-caa2-48fa-95c4-679f16ec203a
3faee87e-2793-4a05-b08b-197f508e5b7e	create unique user config	c3ee8ea6-caa2-48fa-95c4-679f16ec203a
93dff954-cba6-4c3d-94f3-aa76b46c7e10	review profile config	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1
0bd6d4f2-a895-4c6d-b3ae-c239d75c6307	create unique user config	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1
6426e1af-83ac-43c7-a051-6f7e22788f34	review profile config	e8cfaa41-db82-4979-8f75-429ff43b53b9
4769387d-c193-401b-913a-494e58d0524a	create unique user config	e8cfaa41-db82-4979-8f75-429ff43b53b9
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
0bb403fa-edc1-4a5d-882d-087ea6d79db6	false	require.password.update.after.registration
f19a953e-594a-47ad-bb48-ffe5f2d41c80	missing	update.profile.on.first.login
3faee87e-2793-4a05-b08b-197f508e5b7e	false	require.password.update.after.registration
c0c4de44-f8f8-4656-a2b3-fff0798b307e	missing	update.profile.on.first.login
0bd6d4f2-a895-4c6d-b3ae-c239d75c6307	false	require.password.update.after.registration
93dff954-cba6-4c3d-94f3-aa76b46c7e10	missing	update.profile.on.first.login
4769387d-c193-401b-913a-494e58d0524a	false	require.password.update.after.registration
6426e1af-83ac-43c7-a051-6f7e22788f34	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
dc9be43b-8068-492e-a0f5-9d96e465557c	t	f	master-realm	0	f	\N	\N	t	\N	f	cb748a80-a440-40dc-ba38-53857fbff49b	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
d5282b6f-d7eb-4a78-9b7f-a1b61219229d	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	cb748a80-a440-40dc-ba38-53857fbff49b	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
4389593f-caca-4f5a-9deb-3e2cc20892da	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	cb748a80-a440-40dc-ba38-53857fbff49b	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
d01dc9af-1719-4601-ad41-5d5e70e3cd24	t	f	broker	0	f	\N	\N	t	\N	f	cb748a80-a440-40dc-ba38-53857fbff49b	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
7d83e93d-0083-4e82-994f-2da2b7a5ac46	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	cb748a80-a440-40dc-ba38-53857fbff49b	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
f6e8c348-95cf-425f-a4b1-8ede986b51af	t	f	admin-cli	0	t	\N	\N	f	\N	f	cb748a80-a440-40dc-ba38-53857fbff49b	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
4ba52d1e-3069-4e20-9ae8-633d3f825441	t	f	local-realm	0	f	\N	\N	t	\N	f	cb748a80-a440-40dc-ba38-53857fbff49b	\N	0	f	f	local Realm	f	client-secret	\N	\N	\N	t	f	f	f
c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	f	realm-management	0	f	\N	\N	t	\N	f	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
865f4804-4069-4a4c-b155-9a16686c3465	t	f	account	0	t	\N	/realms/local/account/	f	\N	f	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
2682a4aa-1e30-4d13-bd52-67435bb29ac2	t	f	account-console	0	t	\N	/realms/local/account/	f	\N	f	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
0de05ff6-b163-43ce-b5a7-aa4e3a1d62ec	t	f	broker	0	f	\N	\N	t	\N	f	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
c1a4b05c-5a99-4092-9593-2081bc7a1c30	t	f	security-admin-console	0	t	\N	/admin/local/console/	f	\N	f	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
1ea1462b-cbda-4d95-a67d-fcba03a8c495	t	f	admin-cli	0	t	\N	\N	f	\N	f	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
4beaf17c-a463-4896-9314-a4b22bd894b5	t	t	sikved	0	t	\N		f		f	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	openid-connect	-1	t	f	sikved	f	client-secret		test client for sikved project with PKCE enabled	\N	t	f	t	f
41a1caef-08cf-47a5-80c0-98aff7ae2f33	t	t	digital-logbog	0	t	\N		f		f	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	openid-connect	-1	t	f	digital-logbog	f	client-secret		client for digitallogbog	\N	t	f	t	f
375b8a4c-a514-4211-9300-6ccd36393276	t	f	broker	0	f	\N	\N	t	\N	f	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
12215ae6-3f08-4e58-b662-ff85df0effb1	t	f	security-admin-console	0	t	\N	/admin/dcs/console/	f	\N	f	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
dd698d64-d69b-42cb-b259-6b77b3f79593	t	f	admin-cli	0	t	\N	\N	f	\N	f	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
59e17908-b00e-489f-9d33-3b3b300f25da	t	f	dcs-realm	0	f	\N	\N	t	\N	f	cb748a80-a440-40dc-ba38-53857fbff49b	\N	0	f	f	dcs Realm	f	client-secret	\N	\N	\N	t	f	f	f
6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	f	realm-management	0	f	\N	\N	t	\N	f	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
ab24de49-f9f2-4708-8f42-3c51040d035b	t	f	account	0	t	\N	/realms/dcs/account/	f	\N	f	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
35bf4270-3a4c-4caf-9241-b183b0a838fe	t	f	account-console	0	t	\N	/realms/dcs/account/	f	\N	f	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	t	t	digital-logbog	0	t	\N		f		f	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	openid-connect	-1	t	f	client for digitallogbog	f	client-secret		the client in this realm emulates as DCS login	\N	t	f	t	f
38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	f	azure-realm	0	f	\N	\N	t	\N	f	cb748a80-a440-40dc-ba38-53857fbff49b	\N	0	f	f	azure Realm	f	client-secret	\N	\N	\N	t	f	f	f
3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	f	realm-management	0	f	\N	\N	t	\N	f	e8cfaa41-db82-4979-8f75-429ff43b53b9	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
dc94d641-7e97-455e-970b-f3e58ae7eb03	t	f	account	0	t	\N	/realms/azure/account/	f	\N	f	e8cfaa41-db82-4979-8f75-429ff43b53b9	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
748c182c-60f3-47cd-bcad-e836a4ae5090	t	f	account-console	0	t	\N	/realms/azure/account/	f	\N	f	e8cfaa41-db82-4979-8f75-429ff43b53b9	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
0a438640-c32b-466a-99b8-536c23169b1f	t	f	broker	0	f	\N	\N	t	\N	f	e8cfaa41-db82-4979-8f75-429ff43b53b9	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
b5858d86-6a83-43ba-a4b0-a0dd5e663059	t	f	security-admin-console	0	t	\N	/admin/azure/console/	f	\N	f	e8cfaa41-db82-4979-8f75-429ff43b53b9	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
6e2d024f-ac1f-4f1e-b7c4-7523e06ade2c	t	f	admin-cli	0	t	\N	\N	f	\N	f	e8cfaa41-db82-4979-8f75-429ff43b53b9	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
6abdd522-ccc5-4de9-88eb-83c8366acdc2	t	t	digital-logbog	0	t	\N		f		f	e8cfaa41-db82-4979-8f75-429ff43b53b9	openid-connect	-1	t	f	digital-logbog	f	client-secret		client for digital logbog in the azure realm, controllers (skat employees) 	\N	t	f	t	f
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	t	t	ligningslov	0	t	\N	http://ligningslov.localtest.me	f		f	cb748a80-a440-40dc-ba38-53857fbff49b	openid-connect	-1	t	f	ligningslov	f	client-secret			\N	t	f	t	f
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	t	t	ligningslov	0	t	\N		f		f	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	openid-connect	-1	t	f	ligningslov	f	client-secret			\N	t	f	t	f
a09f6280-72d4-41eb-8043-78a465df485b	t	t	toldkontrolapp	0	t	\N		f		f	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	openid-connect	-1	t	f	toldkontrolapp	f	client-secret			\N	t	f	t	f
3b60edca-5a67-4e90-b024-5f870858001b	t	t	dupla	0	t	\N		f		f	e8cfaa41-db82-4979-8f75-429ff43b53b9	openid-connect	-1	t	f	dupla	f	client-secret			\N	t	f	t	f
977c1cf5-951a-41d0-82d1-e78c0297d109	t	t	skattekonto	0	t	\N		f		f	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	openid-connect	-1	t	f	skattekonto	f	client-secret		test client for skattekonto project with PKCE enabled	\N	t	f	t	f
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	t	t	toldkontrolapp	0	t	\N		f		f	e8cfaa41-db82-4979-8f75-429ff43b53b9	openid-connect	-1	t	f	toldkontrolapp	f	client-secret		For toldkontrol	\N	t	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
d5282b6f-d7eb-4a78-9b7f-a1b61219229d	post.logout.redirect.uris	+
4389593f-caca-4f5a-9deb-3e2cc20892da	post.logout.redirect.uris	+
4389593f-caca-4f5a-9deb-3e2cc20892da	pkce.code.challenge.method	S256
7d83e93d-0083-4e82-994f-2da2b7a5ac46	post.logout.redirect.uris	+
7d83e93d-0083-4e82-994f-2da2b7a5ac46	pkce.code.challenge.method	S256
865f4804-4069-4a4c-b155-9a16686c3465	post.logout.redirect.uris	+
2682a4aa-1e30-4d13-bd52-67435bb29ac2	post.logout.redirect.uris	+
2682a4aa-1e30-4d13-bd52-67435bb29ac2	pkce.code.challenge.method	S256
c1a4b05c-5a99-4092-9593-2081bc7a1c30	post.logout.redirect.uris	+
c1a4b05c-5a99-4092-9593-2081bc7a1c30	pkce.code.challenge.method	S256
4beaf17c-a463-4896-9314-a4b22bd894b5	oauth2.device.authorization.grant.enabled	false
4beaf17c-a463-4896-9314-a4b22bd894b5	oidc.ciba.grant.enabled	false
4beaf17c-a463-4896-9314-a4b22bd894b5	backchannel.logout.session.required	true
4beaf17c-a463-4896-9314-a4b22bd894b5	backchannel.logout.revoke.offline.tokens	false
4beaf17c-a463-4896-9314-a4b22bd894b5	display.on.consent.screen	false
4beaf17c-a463-4896-9314-a4b22bd894b5	use.refresh.tokens	true
4beaf17c-a463-4896-9314-a4b22bd894b5	client_credentials.use_refresh_token	false
4beaf17c-a463-4896-9314-a4b22bd894b5	token.response.type.bearer.lower-case	false
4beaf17c-a463-4896-9314-a4b22bd894b5	tls.client.certificate.bound.access.tokens	false
4beaf17c-a463-4896-9314-a4b22bd894b5	pkce.code.challenge.method	S256
4beaf17c-a463-4896-9314-a4b22bd894b5	require.pushed.authorization.requests	false
4beaf17c-a463-4896-9314-a4b22bd894b5	acr.loa.map	{}
41a1caef-08cf-47a5-80c0-98aff7ae2f33	oauth2.device.authorization.grant.enabled	false
41a1caef-08cf-47a5-80c0-98aff7ae2f33	oidc.ciba.grant.enabled	false
41a1caef-08cf-47a5-80c0-98aff7ae2f33	backchannel.logout.session.required	true
41a1caef-08cf-47a5-80c0-98aff7ae2f33	backchannel.logout.revoke.offline.tokens	false
ab24de49-f9f2-4708-8f42-3c51040d035b	post.logout.redirect.uris	+
35bf4270-3a4c-4caf-9241-b183b0a838fe	post.logout.redirect.uris	+
35bf4270-3a4c-4caf-9241-b183b0a838fe	pkce.code.challenge.method	S256
12215ae6-3f08-4e58-b662-ff85df0effb1	post.logout.redirect.uris	+
12215ae6-3f08-4e58-b662-ff85df0effb1	pkce.code.challenge.method	S256
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	oauth2.device.authorization.grant.enabled	false
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	oidc.ciba.grant.enabled	false
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	backchannel.logout.session.required	true
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	backchannel.logout.revoke.offline.tokens	false
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	display.on.consent.screen	false
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	use.refresh.tokens	true
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	client_credentials.use_refresh_token	false
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	token.response.type.bearer.lower-case	false
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	tls.client.certificate.bound.access.tokens	false
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	pkce.code.challenge.method	S256
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	require.pushed.authorization.requests	false
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	acr.loa.map	{}
dc94d641-7e97-455e-970b-f3e58ae7eb03	post.logout.redirect.uris	+
748c182c-60f3-47cd-bcad-e836a4ae5090	post.logout.redirect.uris	+
748c182c-60f3-47cd-bcad-e836a4ae5090	pkce.code.challenge.method	S256
b5858d86-6a83-43ba-a4b0-a0dd5e663059	post.logout.redirect.uris	+
b5858d86-6a83-43ba-a4b0-a0dd5e663059	pkce.code.challenge.method	S256
6abdd522-ccc5-4de9-88eb-83c8366acdc2	oauth2.device.authorization.grant.enabled	false
6abdd522-ccc5-4de9-88eb-83c8366acdc2	oidc.ciba.grant.enabled	false
6abdd522-ccc5-4de9-88eb-83c8366acdc2	backchannel.logout.session.required	true
6abdd522-ccc5-4de9-88eb-83c8366acdc2	backchannel.logout.revoke.offline.tokens	false
6abdd522-ccc5-4de9-88eb-83c8366acdc2	display.on.consent.screen	false
6abdd522-ccc5-4de9-88eb-83c8366acdc2	use.refresh.tokens	true
6abdd522-ccc5-4de9-88eb-83c8366acdc2	client_credentials.use_refresh_token	false
6abdd522-ccc5-4de9-88eb-83c8366acdc2	token.response.type.bearer.lower-case	false
6abdd522-ccc5-4de9-88eb-83c8366acdc2	tls.client.certificate.bound.access.tokens	false
6abdd522-ccc5-4de9-88eb-83c8366acdc2	pkce.code.challenge.method	S256
6abdd522-ccc5-4de9-88eb-83c8366acdc2	require.pushed.authorization.requests	false
6abdd522-ccc5-4de9-88eb-83c8366acdc2	acr.loa.map	{}
6abdd522-ccc5-4de9-88eb-83c8366acdc2	client.secret.creation.time	1701805236
4beaf17c-a463-4896-9314-a4b22bd894b5	post.logout.redirect.uris	http://localhost:8080/*##*
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	oauth2.device.authorization.grant.enabled	false
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	oidc.ciba.grant.enabled	false
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	backchannel.logout.session.required	true
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	backchannel.logout.revoke.offline.tokens	false
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	display.on.consent.screen	false
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	oauth2.device.authorization.grant.enabled	false
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	oidc.ciba.grant.enabled	false
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	backchannel.logout.session.required	true
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	backchannel.logout.revoke.offline.tokens	false
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	display.on.consent.screen	false
a09f6280-72d4-41eb-8043-78a465df485b	oauth2.device.authorization.grant.enabled	false
a09f6280-72d4-41eb-8043-78a465df485b	oidc.ciba.grant.enabled	false
a09f6280-72d4-41eb-8043-78a465df485b	post.logout.redirect.uris	toldkontrol:/callback##https://toko.localtest.me/*##http://toko.localtest.me/*
a09f6280-72d4-41eb-8043-78a465df485b	backchannel.logout.session.required	true
a09f6280-72d4-41eb-8043-78a465df485b	backchannel.logout.revoke.offline.tokens	false
3b60edca-5a67-4e90-b024-5f870858001b	oauth2.device.authorization.grant.enabled	false
3b60edca-5a67-4e90-b024-5f870858001b	oidc.ciba.grant.enabled	false
3b60edca-5a67-4e90-b024-5f870858001b	backchannel.logout.session.required	true
3b60edca-5a67-4e90-b024-5f870858001b	backchannel.logout.revoke.offline.tokens	false
3b60edca-5a67-4e90-b024-5f870858001b	display.on.consent.screen	false
977c1cf5-951a-41d0-82d1-e78c0297d109	oauth2.device.authorization.grant.enabled	false
977c1cf5-951a-41d0-82d1-e78c0297d109	oidc.ciba.grant.enabled	false
977c1cf5-951a-41d0-82d1-e78c0297d109	post.logout.redirect.uris	http://localhost:8080/*##*
977c1cf5-951a-41d0-82d1-e78c0297d109	backchannel.logout.session.required	true
977c1cf5-951a-41d0-82d1-e78c0297d109	backchannel.logout.revoke.offline.tokens	false
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	oauth2.device.authorization.grant.enabled	false
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	oidc.ciba.grant.enabled	false
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	backchannel.logout.session.required	true
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	backchannel.logout.revoke.offline.tokens	false
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	display.on.consent.screen	false
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
aa898c53-8064-4a3c-87ff-2759bc55813a	offline_access	cb748a80-a440-40dc-ba38-53857fbff49b	OpenID Connect built-in scope: offline_access	openid-connect
b3a6718f-bc6d-4e9e-9dd1-1cba829e1962	role_list	cb748a80-a440-40dc-ba38-53857fbff49b	SAML role list	saml
8a451c75-1e82-40c8-844c-effc3e8997da	profile	cb748a80-a440-40dc-ba38-53857fbff49b	OpenID Connect built-in scope: profile	openid-connect
feb05054-e00e-4eae-ae2b-2aacad60ff56	email	cb748a80-a440-40dc-ba38-53857fbff49b	OpenID Connect built-in scope: email	openid-connect
a9dc70ea-284e-430e-bf27-23bed1b9038f	address	cb748a80-a440-40dc-ba38-53857fbff49b	OpenID Connect built-in scope: address	openid-connect
9163e38c-4fc7-48cd-a7f0-62e0bc6ee764	phone	cb748a80-a440-40dc-ba38-53857fbff49b	OpenID Connect built-in scope: phone	openid-connect
5edcf47d-a0a6-49ad-914d-b03cccb0272f	roles	cb748a80-a440-40dc-ba38-53857fbff49b	OpenID Connect scope for add user roles to the access token	openid-connect
b2a098b6-354a-4122-b4dd-6deaf75c826c	web-origins	cb748a80-a440-40dc-ba38-53857fbff49b	OpenID Connect scope for add allowed web origins to the access token	openid-connect
ed47a062-505e-4cbd-a35d-853b905165d5	microprofile-jwt	cb748a80-a440-40dc-ba38-53857fbff49b	Microprofile - JWT built-in scope	openid-connect
ac7833ff-d882-4714-a621-65ff8913ce37	acr	cb748a80-a440-40dc-ba38-53857fbff49b	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
a980e909-9ebc-42f0-b919-273f948c9e53	offline_access	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	OpenID Connect built-in scope: offline_access	openid-connect
52d8e236-5515-4590-9f33-a6a3c96a3395	role_list	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	SAML role list	saml
fa1609b7-8e09-4b8a-8cba-074a6f174fdc	profile	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	OpenID Connect built-in scope: profile	openid-connect
f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	email	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	OpenID Connect built-in scope: email	openid-connect
fc6fbe06-c104-4561-9fe3-74486bb46212	address	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	OpenID Connect built-in scope: address	openid-connect
80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	phone	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	OpenID Connect built-in scope: phone	openid-connect
aeb4cff8-2781-4f07-9965-7cce39afb2e2	roles	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	OpenID Connect scope for add user roles to the access token	openid-connect
bf1fe07f-6faa-432a-aa64-57dbf2bcb443	web-origins	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	OpenID Connect scope for add allowed web origins to the access token	openid-connect
7241ba22-96f1-45ff-8497-ae6343f7cc91	microprofile-jwt	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	Microprofile - JWT built-in scope	openid-connect
7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	acr	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
71427592-7de6-4d12-b8bc-f96289726cfd	toldst	c3ee8ea6-caa2-48fa-95c4-679f16ec203a		openid-connect
894a7511-1ee9-4f9e-ae42-99a2db2a66d7	openid	c3ee8ea6-caa2-48fa-95c4-679f16ec203a		openid-connect
2dbf443b-c04b-46e2-b341-82f7bd298ce0	digital-logbog	c3ee8ea6-caa2-48fa-95c4-679f16ec203a		openid-connect
7d9df514-e8f6-4e2b-bf99-36e0a2a05610	role_list	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	SAML role list	saml
c0d0b991-495b-4484-bc1f-24edcf8a7fca	profile	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	OpenID Connect built-in scope: profile	openid-connect
03d185fa-0e2a-47af-a2da-cd4b600619b6	email	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	OpenID Connect built-in scope: email	openid-connect
8e6883b3-ba8d-4ef6-97b2-092673d11aed	address	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	OpenID Connect built-in scope: address	openid-connect
120b2b69-b8a2-4380-9cd9-3cb49886a804	phone	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	OpenID Connect built-in scope: phone	openid-connect
dc866a59-7994-42f6-9625-4c5a2705e00d	offline_access	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	OpenID Connect built-in scope: offline_access	openid-connect
ac1492d2-e3bd-4242-affe-f372e109f284	roles	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	OpenID Connect scope for add user roles to the access token	openid-connect
57e8e861-c01e-444a-b017-939b46021f12	web-origins	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	OpenID Connect scope for add allowed web origins to the access token	openid-connect
c054c6af-66f1-4a65-b61d-d0ba709be07e	microprofile-jwt	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	Microprofile - JWT built-in scope	openid-connect
973b4773-66e0-4036-903e-922011f627b9	acr	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
99bf78ca-c748-4846-88ba-c829dbedcba0	openid	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	openid scope for digitallogbog	openid-connect
0287610d-5a4f-4818-84e1-b1a9c0b8e914	digital-logbog	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1		openid-connect
f4c6c4b5-b7a6-4bb4-8eb3-3dad37064741	delegatorTypeOfIdentifier	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1		openid-connect
73014569-6884-40b6-a0bf-83e3560f9ee5	delegatorTypeOfActor	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	delegatorTypeOfActor	openid-connect
096c8c1f-dacf-4ec4-a9e2-18dd3ec7445a	legalname	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	legalname	openid-connect
4d2dee30-44e9-47ba-9a61-24911ce5575f	typeOfIdentifier	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	typeOfIdentifier	openid-connect
aa02a150-384e-4574-9f0f-844847b2397d	delegatorLegalname	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	delegatorLegalname	openid-connect
6f886051-b217-4e14-9f52-7a7b30e2f47e	delegatorAlternateIdentifierType	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	delegatorAlternateIdentifierType	openid-connect
196b6d76-880c-43b7-99c4-7e171a4177bf	delegatorTypeOfPerson	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	delegatorTypeOfPerson	openid-connect
9d05b36e-dd7c-4980-b974-834f78aae1f9	delegatorAlternateName	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	delegatorAlternateName	openid-connect
00bf4cec-949b-4725-9277-0e64219a6ffc	delegatorAlternateIdentifier	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	delegatorAlternateIdentifier	openid-connect
6b5ae4d9-135f-4c09-875e-a9314338f847	countryCode	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	countryCode	openid-connect
ec15f768-3f29-4ec3-9030-62dfcb9491e3	delegatorIdentifier	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	delegatorIdentifier	openid-connect
f00cc02d-3685-4a80-ab60-807977e25269	typeOfActor	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	typeOfActor	openid-connect
e203eb9b-87ef-41f3-bb70-6cf0519cf09a	eIdentifier	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	eIdentifier	openid-connect
ca9ecc5b-1a1e-4431-9835-9612e24a660f	delegatorCountryCode	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	delegatorCountryCode	openid-connect
d63dac92-75f1-45ce-8df5-85b25ca56e84	typeOfPerson	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	typeOfPerson	openid-connect
9bf965e9-5b33-499e-93a9-a51b92d82d49	offline_access	e8cfaa41-db82-4979-8f75-429ff43b53b9	OpenID Connect built-in scope: offline_access	openid-connect
a882fa49-d884-4231-8b49-2cb54d8b4b3c	role_list	e8cfaa41-db82-4979-8f75-429ff43b53b9	SAML role list	saml
8eb116e9-672d-4906-af77-9d4005fb7bc9	profile	e8cfaa41-db82-4979-8f75-429ff43b53b9	OpenID Connect built-in scope: profile	openid-connect
3e197c3e-4383-4fda-bdd7-51c57f4cb087	email	e8cfaa41-db82-4979-8f75-429ff43b53b9	OpenID Connect built-in scope: email	openid-connect
1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	address	e8cfaa41-db82-4979-8f75-429ff43b53b9	OpenID Connect built-in scope: address	openid-connect
90db1804-b170-4b99-be1d-64a8a40514a2	phone	e8cfaa41-db82-4979-8f75-429ff43b53b9	OpenID Connect built-in scope: phone	openid-connect
0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	roles	e8cfaa41-db82-4979-8f75-429ff43b53b9	OpenID Connect scope for add user roles to the access token	openid-connect
6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd	web-origins	e8cfaa41-db82-4979-8f75-429ff43b53b9	OpenID Connect scope for add allowed web origins to the access token	openid-connect
f7a19d3c-7e9c-4b6c-b123-aa14d4581a24	microprofile-jwt	e8cfaa41-db82-4979-8f75-429ff43b53b9	Microprofile - JWT built-in scope	openid-connect
a1ed248a-e826-4058-9919-32a365698eb2	acr	e8cfaa41-db82-4979-8f75-429ff43b53b9	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
3121e21e-0b05-4b74-8710-fd97bdeb03ce	openid	e8cfaa41-db82-4979-8f75-429ff43b53b9		openid-connect
4c190d2f-aba2-4230-ba17-e5cdeed39c21	digital-logbog	e8cfaa41-db82-4979-8f75-429ff43b53b9		openid-connect
c0f52a89-0999-433f-812c-f924e13dfde2	skatMedarbejderADAfdelingKontor	e8cfaa41-db82-4979-8f75-429ff43b53b9	skatMedarbejderADAfdelingKontor	openid-connect
6e7c245c-a1ba-4a52-a6ce-52626366650f	skatMedarbejderADNummer	e8cfaa41-db82-4979-8f75-429ff43b53b9	skatMedarbejderADNummer	openid-connect
ea68e07d-9375-4f5c-84d2-5958affd9ce3	ligningslov	c3ee8ea6-caa2-48fa-95c4-679f16ec203a		openid-connect
25def575-2d44-412e-9b07-8826dbc3ce18	dupla	e8cfaa41-db82-4979-8f75-429ff43b53b9		openid-connect
be4ae291-0bdb-403c-a637-70ab5313253f	azuretojwt	e8cfaa41-db82-4979-8f75-429ff43b53b9		openid-connect
57151a45-3d35-4b24-9075-3fdf3f9545c8	skattekonto	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1		openid-connect
74a91d48-7c47-42aa-8b23-c05c270d5598	toldkontrolapp	e8cfaa41-db82-4979-8f75-429ff43b53b9		openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
aa898c53-8064-4a3c-87ff-2759bc55813a	true	display.on.consent.screen
aa898c53-8064-4a3c-87ff-2759bc55813a	${offlineAccessScopeConsentText}	consent.screen.text
b3a6718f-bc6d-4e9e-9dd1-1cba829e1962	true	display.on.consent.screen
b3a6718f-bc6d-4e9e-9dd1-1cba829e1962	${samlRoleListScopeConsentText}	consent.screen.text
8a451c75-1e82-40c8-844c-effc3e8997da	true	display.on.consent.screen
8a451c75-1e82-40c8-844c-effc3e8997da	${profileScopeConsentText}	consent.screen.text
8a451c75-1e82-40c8-844c-effc3e8997da	true	include.in.token.scope
feb05054-e00e-4eae-ae2b-2aacad60ff56	true	display.on.consent.screen
feb05054-e00e-4eae-ae2b-2aacad60ff56	${emailScopeConsentText}	consent.screen.text
feb05054-e00e-4eae-ae2b-2aacad60ff56	true	include.in.token.scope
a9dc70ea-284e-430e-bf27-23bed1b9038f	true	display.on.consent.screen
a9dc70ea-284e-430e-bf27-23bed1b9038f	${addressScopeConsentText}	consent.screen.text
a9dc70ea-284e-430e-bf27-23bed1b9038f	true	include.in.token.scope
9163e38c-4fc7-48cd-a7f0-62e0bc6ee764	true	display.on.consent.screen
9163e38c-4fc7-48cd-a7f0-62e0bc6ee764	${phoneScopeConsentText}	consent.screen.text
9163e38c-4fc7-48cd-a7f0-62e0bc6ee764	true	include.in.token.scope
5edcf47d-a0a6-49ad-914d-b03cccb0272f	true	display.on.consent.screen
5edcf47d-a0a6-49ad-914d-b03cccb0272f	${rolesScopeConsentText}	consent.screen.text
5edcf47d-a0a6-49ad-914d-b03cccb0272f	false	include.in.token.scope
b2a098b6-354a-4122-b4dd-6deaf75c826c	false	display.on.consent.screen
b2a098b6-354a-4122-b4dd-6deaf75c826c		consent.screen.text
b2a098b6-354a-4122-b4dd-6deaf75c826c	false	include.in.token.scope
ed47a062-505e-4cbd-a35d-853b905165d5	false	display.on.consent.screen
ed47a062-505e-4cbd-a35d-853b905165d5	true	include.in.token.scope
ac7833ff-d882-4714-a621-65ff8913ce37	false	display.on.consent.screen
ac7833ff-d882-4714-a621-65ff8913ce37	false	include.in.token.scope
a980e909-9ebc-42f0-b919-273f948c9e53	true	display.on.consent.screen
a980e909-9ebc-42f0-b919-273f948c9e53	${offlineAccessScopeConsentText}	consent.screen.text
52d8e236-5515-4590-9f33-a6a3c96a3395	true	display.on.consent.screen
52d8e236-5515-4590-9f33-a6a3c96a3395	${samlRoleListScopeConsentText}	consent.screen.text
fa1609b7-8e09-4b8a-8cba-074a6f174fdc	true	display.on.consent.screen
fa1609b7-8e09-4b8a-8cba-074a6f174fdc	${profileScopeConsentText}	consent.screen.text
fa1609b7-8e09-4b8a-8cba-074a6f174fdc	true	include.in.token.scope
f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	true	display.on.consent.screen
f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	${emailScopeConsentText}	consent.screen.text
f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	true	include.in.token.scope
fc6fbe06-c104-4561-9fe3-74486bb46212	true	display.on.consent.screen
fc6fbe06-c104-4561-9fe3-74486bb46212	${addressScopeConsentText}	consent.screen.text
fc6fbe06-c104-4561-9fe3-74486bb46212	true	include.in.token.scope
80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	true	display.on.consent.screen
80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	${phoneScopeConsentText}	consent.screen.text
80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	true	include.in.token.scope
aeb4cff8-2781-4f07-9965-7cce39afb2e2	true	display.on.consent.screen
aeb4cff8-2781-4f07-9965-7cce39afb2e2	${rolesScopeConsentText}	consent.screen.text
bf1fe07f-6faa-432a-aa64-57dbf2bcb443	false	display.on.consent.screen
bf1fe07f-6faa-432a-aa64-57dbf2bcb443		consent.screen.text
bf1fe07f-6faa-432a-aa64-57dbf2bcb443	false	include.in.token.scope
7241ba22-96f1-45ff-8497-ae6343f7cc91	false	display.on.consent.screen
7241ba22-96f1-45ff-8497-ae6343f7cc91	true	include.in.token.scope
7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	false	display.on.consent.screen
7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	false	include.in.token.scope
71427592-7de6-4d12-b8bc-f96289726cfd		consent.screen.text
71427592-7de6-4d12-b8bc-f96289726cfd	true	display.on.consent.screen
71427592-7de6-4d12-b8bc-f96289726cfd	true	include.in.token.scope
71427592-7de6-4d12-b8bc-f96289726cfd		gui.order
894a7511-1ee9-4f9e-ae42-99a2db2a66d7		consent.screen.text
894a7511-1ee9-4f9e-ae42-99a2db2a66d7	false	display.on.consent.screen
894a7511-1ee9-4f9e-ae42-99a2db2a66d7	false	include.in.token.scope
894a7511-1ee9-4f9e-ae42-99a2db2a66d7		gui.order
2dbf443b-c04b-46e2-b341-82f7bd298ce0		consent.screen.text
2dbf443b-c04b-46e2-b341-82f7bd298ce0	false	display.on.consent.screen
2dbf443b-c04b-46e2-b341-82f7bd298ce0	false	include.in.token.scope
2dbf443b-c04b-46e2-b341-82f7bd298ce0		gui.order
dc866a59-7994-42f6-9625-4c5a2705e00d	true	display.on.consent.screen
dc866a59-7994-42f6-9625-4c5a2705e00d	${offlineAccessScopeConsentText}	consent.screen.text
7d9df514-e8f6-4e2b-bf99-36e0a2a05610	true	display.on.consent.screen
7d9df514-e8f6-4e2b-bf99-36e0a2a05610	${samlRoleListScopeConsentText}	consent.screen.text
c0d0b991-495b-4484-bc1f-24edcf8a7fca	true	display.on.consent.screen
c0d0b991-495b-4484-bc1f-24edcf8a7fca	${profileScopeConsentText}	consent.screen.text
c0d0b991-495b-4484-bc1f-24edcf8a7fca	true	include.in.token.scope
03d185fa-0e2a-47af-a2da-cd4b600619b6	true	display.on.consent.screen
03d185fa-0e2a-47af-a2da-cd4b600619b6	${emailScopeConsentText}	consent.screen.text
03d185fa-0e2a-47af-a2da-cd4b600619b6	true	include.in.token.scope
8e6883b3-ba8d-4ef6-97b2-092673d11aed	true	display.on.consent.screen
8e6883b3-ba8d-4ef6-97b2-092673d11aed	${addressScopeConsentText}	consent.screen.text
8e6883b3-ba8d-4ef6-97b2-092673d11aed	true	include.in.token.scope
120b2b69-b8a2-4380-9cd9-3cb49886a804	true	display.on.consent.screen
120b2b69-b8a2-4380-9cd9-3cb49886a804	${phoneScopeConsentText}	consent.screen.text
120b2b69-b8a2-4380-9cd9-3cb49886a804	true	include.in.token.scope
ac1492d2-e3bd-4242-affe-f372e109f284	true	display.on.consent.screen
ac1492d2-e3bd-4242-affe-f372e109f284	${rolesScopeConsentText}	consent.screen.text
ac1492d2-e3bd-4242-affe-f372e109f284	false	include.in.token.scope
57e8e861-c01e-444a-b017-939b46021f12	false	display.on.consent.screen
57e8e861-c01e-444a-b017-939b46021f12		consent.screen.text
57e8e861-c01e-444a-b017-939b46021f12	false	include.in.token.scope
c054c6af-66f1-4a65-b61d-d0ba709be07e	false	display.on.consent.screen
c054c6af-66f1-4a65-b61d-d0ba709be07e	true	include.in.token.scope
973b4773-66e0-4036-903e-922011f627b9	false	display.on.consent.screen
973b4773-66e0-4036-903e-922011f627b9	false	include.in.token.scope
99bf78ca-c748-4846-88ba-c829dbedcba0		consent.screen.text
99bf78ca-c748-4846-88ba-c829dbedcba0	false	display.on.consent.screen
99bf78ca-c748-4846-88ba-c829dbedcba0		gui.order
0287610d-5a4f-4818-84e1-b1a9c0b8e914		consent.screen.text
0287610d-5a4f-4818-84e1-b1a9c0b8e914	false	display.on.consent.screen
0287610d-5a4f-4818-84e1-b1a9c0b8e914		gui.order
f4c6c4b5-b7a6-4bb4-8eb3-3dad37064741		consent.screen.text
f4c6c4b5-b7a6-4bb4-8eb3-3dad37064741	false	include.in.token.scope
f4c6c4b5-b7a6-4bb4-8eb3-3dad37064741		gui.order
73014569-6884-40b6-a0bf-83e3560f9ee5		consent.screen.text
73014569-6884-40b6-a0bf-83e3560f9ee5	false	display.on.consent.screen
73014569-6884-40b6-a0bf-83e3560f9ee5		gui.order
096c8c1f-dacf-4ec4-a9e2-18dd3ec7445a		consent.screen.text
096c8c1f-dacf-4ec4-a9e2-18dd3ec7445a	false	display.on.consent.screen
096c8c1f-dacf-4ec4-a9e2-18dd3ec7445a	true	include.in.token.scope
096c8c1f-dacf-4ec4-a9e2-18dd3ec7445a		gui.order
4d2dee30-44e9-47ba-9a61-24911ce5575f		consent.screen.text
4d2dee30-44e9-47ba-9a61-24911ce5575f	false	display.on.consent.screen
4d2dee30-44e9-47ba-9a61-24911ce5575f		gui.order
aa02a150-384e-4574-9f0f-844847b2397d		consent.screen.text
aa02a150-384e-4574-9f0f-844847b2397d	false	display.on.consent.screen
aa02a150-384e-4574-9f0f-844847b2397d		gui.order
6f886051-b217-4e14-9f52-7a7b30e2f47e		consent.screen.text
6f886051-b217-4e14-9f52-7a7b30e2f47e	false	display.on.consent.screen
6f886051-b217-4e14-9f52-7a7b30e2f47e	false	include.in.token.scope
6f886051-b217-4e14-9f52-7a7b30e2f47e		gui.order
196b6d76-880c-43b7-99c4-7e171a4177bf		consent.screen.text
196b6d76-880c-43b7-99c4-7e171a4177bf	false	display.on.consent.screen
196b6d76-880c-43b7-99c4-7e171a4177bf		gui.order
9d05b36e-dd7c-4980-b974-834f78aae1f9		consent.screen.text
9d05b36e-dd7c-4980-b974-834f78aae1f9	false	display.on.consent.screen
9d05b36e-dd7c-4980-b974-834f78aae1f9		gui.order
00bf4cec-949b-4725-9277-0e64219a6ffc		consent.screen.text
00bf4cec-949b-4725-9277-0e64219a6ffc	false	display.on.consent.screen
00bf4cec-949b-4725-9277-0e64219a6ffc		gui.order
6b5ae4d9-135f-4c09-875e-a9314338f847		consent.screen.text
6b5ae4d9-135f-4c09-875e-a9314338f847	false	display.on.consent.screen
6b5ae4d9-135f-4c09-875e-a9314338f847	false	include.in.token.scope
6b5ae4d9-135f-4c09-875e-a9314338f847		gui.order
ec15f768-3f29-4ec3-9030-62dfcb9491e3		consent.screen.text
ec15f768-3f29-4ec3-9030-62dfcb9491e3	false	display.on.consent.screen
ec15f768-3f29-4ec3-9030-62dfcb9491e3		gui.order
f00cc02d-3685-4a80-ab60-807977e25269		consent.screen.text
f00cc02d-3685-4a80-ab60-807977e25269	false	display.on.consent.screen
f00cc02d-3685-4a80-ab60-807977e25269		gui.order
e203eb9b-87ef-41f3-bb70-6cf0519cf09a		consent.screen.text
e203eb9b-87ef-41f3-bb70-6cf0519cf09a	false	display.on.consent.screen
9d05b36e-dd7c-4980-b974-834f78aae1f9	false	include.in.token.scope
ec15f768-3f29-4ec3-9030-62dfcb9491e3	false	include.in.token.scope
aa02a150-384e-4574-9f0f-844847b2397d	false	include.in.token.scope
73014569-6884-40b6-a0bf-83e3560f9ee5	false	include.in.token.scope
f4c6c4b5-b7a6-4bb4-8eb3-3dad37064741	false	display.on.consent.screen
196b6d76-880c-43b7-99c4-7e171a4177bf	false	include.in.token.scope
f00cc02d-3685-4a80-ab60-807977e25269	false	include.in.token.scope
4d2dee30-44e9-47ba-9a61-24911ce5575f	false	include.in.token.scope
0287610d-5a4f-4818-84e1-b1a9c0b8e914	true	include.in.token.scope
99bf78ca-c748-4846-88ba-c829dbedcba0	true	include.in.token.scope
e203eb9b-87ef-41f3-bb70-6cf0519cf09a		gui.order
ca9ecc5b-1a1e-4431-9835-9612e24a660f		consent.screen.text
ca9ecc5b-1a1e-4431-9835-9612e24a660f	false	display.on.consent.screen
ca9ecc5b-1a1e-4431-9835-9612e24a660f		gui.order
d63dac92-75f1-45ce-8df5-85b25ca56e84		consent.screen.text
d63dac92-75f1-45ce-8df5-85b25ca56e84	false	display.on.consent.screen
d63dac92-75f1-45ce-8df5-85b25ca56e84		gui.order
00bf4cec-949b-4725-9277-0e64219a6ffc	false	include.in.token.scope
ca9ecc5b-1a1e-4431-9835-9612e24a660f	false	include.in.token.scope
e203eb9b-87ef-41f3-bb70-6cf0519cf09a	false	include.in.token.scope
d63dac92-75f1-45ce-8df5-85b25ca56e84	false	include.in.token.scope
9bf965e9-5b33-499e-93a9-a51b92d82d49	true	display.on.consent.screen
9bf965e9-5b33-499e-93a9-a51b92d82d49	${offlineAccessScopeConsentText}	consent.screen.text
a882fa49-d884-4231-8b49-2cb54d8b4b3c	true	display.on.consent.screen
a882fa49-d884-4231-8b49-2cb54d8b4b3c	${samlRoleListScopeConsentText}	consent.screen.text
8eb116e9-672d-4906-af77-9d4005fb7bc9	true	display.on.consent.screen
8eb116e9-672d-4906-af77-9d4005fb7bc9	${profileScopeConsentText}	consent.screen.text
8eb116e9-672d-4906-af77-9d4005fb7bc9	true	include.in.token.scope
3e197c3e-4383-4fda-bdd7-51c57f4cb087	true	display.on.consent.screen
3e197c3e-4383-4fda-bdd7-51c57f4cb087	${emailScopeConsentText}	consent.screen.text
3e197c3e-4383-4fda-bdd7-51c57f4cb087	true	include.in.token.scope
1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	true	display.on.consent.screen
1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	${addressScopeConsentText}	consent.screen.text
1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	true	include.in.token.scope
90db1804-b170-4b99-be1d-64a8a40514a2	true	display.on.consent.screen
90db1804-b170-4b99-be1d-64a8a40514a2	${phoneScopeConsentText}	consent.screen.text
90db1804-b170-4b99-be1d-64a8a40514a2	true	include.in.token.scope
0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	true	display.on.consent.screen
0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	${rolesScopeConsentText}	consent.screen.text
0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	false	include.in.token.scope
6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd	false	display.on.consent.screen
6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd		consent.screen.text
6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd	false	include.in.token.scope
f7a19d3c-7e9c-4b6c-b123-aa14d4581a24	false	display.on.consent.screen
f7a19d3c-7e9c-4b6c-b123-aa14d4581a24	true	include.in.token.scope
a1ed248a-e826-4058-9919-32a365698eb2	false	display.on.consent.screen
a1ed248a-e826-4058-9919-32a365698eb2	false	include.in.token.scope
3121e21e-0b05-4b74-8710-fd97bdeb03ce		consent.screen.text
3121e21e-0b05-4b74-8710-fd97bdeb03ce	false	display.on.consent.screen
3121e21e-0b05-4b74-8710-fd97bdeb03ce	true	include.in.token.scope
3121e21e-0b05-4b74-8710-fd97bdeb03ce		gui.order
4c190d2f-aba2-4230-ba17-e5cdeed39c21		consent.screen.text
4c190d2f-aba2-4230-ba17-e5cdeed39c21	false	display.on.consent.screen
4c190d2f-aba2-4230-ba17-e5cdeed39c21	true	include.in.token.scope
4c190d2f-aba2-4230-ba17-e5cdeed39c21		gui.order
c0f52a89-0999-433f-812c-f924e13dfde2		consent.screen.text
c0f52a89-0999-433f-812c-f924e13dfde2	false	display.on.consent.screen
c0f52a89-0999-433f-812c-f924e13dfde2	true	include.in.token.scope
c0f52a89-0999-433f-812c-f924e13dfde2		gui.order
6e7c245c-a1ba-4a52-a6ce-52626366650f		consent.screen.text
6e7c245c-a1ba-4a52-a6ce-52626366650f	false	display.on.consent.screen
6e7c245c-a1ba-4a52-a6ce-52626366650f	true	include.in.token.scope
6e7c245c-a1ba-4a52-a6ce-52626366650f		gui.order
aeb4cff8-2781-4f07-9965-7cce39afb2e2		gui.order
aeb4cff8-2781-4f07-9965-7cce39afb2e2	true	include.in.token.scope
ea68e07d-9375-4f5c-84d2-5958affd9ce3		consent.screen.text
ea68e07d-9375-4f5c-84d2-5958affd9ce3	false	display.on.consent.screen
ea68e07d-9375-4f5c-84d2-5958affd9ce3	true	include.in.token.scope
ea68e07d-9375-4f5c-84d2-5958affd9ce3		gui.order
25def575-2d44-412e-9b07-8826dbc3ce18		consent.screen.text
25def575-2d44-412e-9b07-8826dbc3ce18	true	display.on.consent.screen
25def575-2d44-412e-9b07-8826dbc3ce18	true	include.in.token.scope
25def575-2d44-412e-9b07-8826dbc3ce18		gui.order
be4ae291-0bdb-403c-a637-70ab5313253f		consent.screen.text
be4ae291-0bdb-403c-a637-70ab5313253f	false	display.on.consent.screen
be4ae291-0bdb-403c-a637-70ab5313253f	true	include.in.token.scope
be4ae291-0bdb-403c-a637-70ab5313253f		gui.order
57151a45-3d35-4b24-9075-3fdf3f9545c8		consent.screen.text
57151a45-3d35-4b24-9075-3fdf3f9545c8	false	display.on.consent.screen
57151a45-3d35-4b24-9075-3fdf3f9545c8	true	include.in.token.scope
57151a45-3d35-4b24-9075-3fdf3f9545c8		gui.order
74a91d48-7c47-42aa-8b23-c05c270d5598		consent.screen.text
74a91d48-7c47-42aa-8b23-c05c270d5598	true	display.on.consent.screen
74a91d48-7c47-42aa-8b23-c05c270d5598	true	include.in.token.scope
74a91d48-7c47-42aa-8b23-c05c270d5598		gui.order
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
d5282b6f-d7eb-4a78-9b7f-a1b61219229d	8a451c75-1e82-40c8-844c-effc3e8997da	t
d5282b6f-d7eb-4a78-9b7f-a1b61219229d	feb05054-e00e-4eae-ae2b-2aacad60ff56	t
d5282b6f-d7eb-4a78-9b7f-a1b61219229d	b2a098b6-354a-4122-b4dd-6deaf75c826c	t
d5282b6f-d7eb-4a78-9b7f-a1b61219229d	ac7833ff-d882-4714-a621-65ff8913ce37	t
d5282b6f-d7eb-4a78-9b7f-a1b61219229d	5edcf47d-a0a6-49ad-914d-b03cccb0272f	t
d5282b6f-d7eb-4a78-9b7f-a1b61219229d	aa898c53-8064-4a3c-87ff-2759bc55813a	f
d5282b6f-d7eb-4a78-9b7f-a1b61219229d	a9dc70ea-284e-430e-bf27-23bed1b9038f	f
d5282b6f-d7eb-4a78-9b7f-a1b61219229d	9163e38c-4fc7-48cd-a7f0-62e0bc6ee764	f
d5282b6f-d7eb-4a78-9b7f-a1b61219229d	ed47a062-505e-4cbd-a35d-853b905165d5	f
4389593f-caca-4f5a-9deb-3e2cc20892da	8a451c75-1e82-40c8-844c-effc3e8997da	t
4389593f-caca-4f5a-9deb-3e2cc20892da	feb05054-e00e-4eae-ae2b-2aacad60ff56	t
4389593f-caca-4f5a-9deb-3e2cc20892da	b2a098b6-354a-4122-b4dd-6deaf75c826c	t
4389593f-caca-4f5a-9deb-3e2cc20892da	ac7833ff-d882-4714-a621-65ff8913ce37	t
4389593f-caca-4f5a-9deb-3e2cc20892da	5edcf47d-a0a6-49ad-914d-b03cccb0272f	t
4389593f-caca-4f5a-9deb-3e2cc20892da	aa898c53-8064-4a3c-87ff-2759bc55813a	f
4389593f-caca-4f5a-9deb-3e2cc20892da	a9dc70ea-284e-430e-bf27-23bed1b9038f	f
4389593f-caca-4f5a-9deb-3e2cc20892da	9163e38c-4fc7-48cd-a7f0-62e0bc6ee764	f
4389593f-caca-4f5a-9deb-3e2cc20892da	ed47a062-505e-4cbd-a35d-853b905165d5	f
f6e8c348-95cf-425f-a4b1-8ede986b51af	8a451c75-1e82-40c8-844c-effc3e8997da	t
f6e8c348-95cf-425f-a4b1-8ede986b51af	feb05054-e00e-4eae-ae2b-2aacad60ff56	t
f6e8c348-95cf-425f-a4b1-8ede986b51af	b2a098b6-354a-4122-b4dd-6deaf75c826c	t
f6e8c348-95cf-425f-a4b1-8ede986b51af	ac7833ff-d882-4714-a621-65ff8913ce37	t
f6e8c348-95cf-425f-a4b1-8ede986b51af	5edcf47d-a0a6-49ad-914d-b03cccb0272f	t
f6e8c348-95cf-425f-a4b1-8ede986b51af	aa898c53-8064-4a3c-87ff-2759bc55813a	f
f6e8c348-95cf-425f-a4b1-8ede986b51af	a9dc70ea-284e-430e-bf27-23bed1b9038f	f
f6e8c348-95cf-425f-a4b1-8ede986b51af	9163e38c-4fc7-48cd-a7f0-62e0bc6ee764	f
f6e8c348-95cf-425f-a4b1-8ede986b51af	ed47a062-505e-4cbd-a35d-853b905165d5	f
d01dc9af-1719-4601-ad41-5d5e70e3cd24	8a451c75-1e82-40c8-844c-effc3e8997da	t
d01dc9af-1719-4601-ad41-5d5e70e3cd24	feb05054-e00e-4eae-ae2b-2aacad60ff56	t
d01dc9af-1719-4601-ad41-5d5e70e3cd24	b2a098b6-354a-4122-b4dd-6deaf75c826c	t
d01dc9af-1719-4601-ad41-5d5e70e3cd24	ac7833ff-d882-4714-a621-65ff8913ce37	t
d01dc9af-1719-4601-ad41-5d5e70e3cd24	5edcf47d-a0a6-49ad-914d-b03cccb0272f	t
d01dc9af-1719-4601-ad41-5d5e70e3cd24	aa898c53-8064-4a3c-87ff-2759bc55813a	f
d01dc9af-1719-4601-ad41-5d5e70e3cd24	a9dc70ea-284e-430e-bf27-23bed1b9038f	f
d01dc9af-1719-4601-ad41-5d5e70e3cd24	9163e38c-4fc7-48cd-a7f0-62e0bc6ee764	f
d01dc9af-1719-4601-ad41-5d5e70e3cd24	ed47a062-505e-4cbd-a35d-853b905165d5	f
dc9be43b-8068-492e-a0f5-9d96e465557c	8a451c75-1e82-40c8-844c-effc3e8997da	t
dc9be43b-8068-492e-a0f5-9d96e465557c	feb05054-e00e-4eae-ae2b-2aacad60ff56	t
dc9be43b-8068-492e-a0f5-9d96e465557c	b2a098b6-354a-4122-b4dd-6deaf75c826c	t
dc9be43b-8068-492e-a0f5-9d96e465557c	ac7833ff-d882-4714-a621-65ff8913ce37	t
dc9be43b-8068-492e-a0f5-9d96e465557c	5edcf47d-a0a6-49ad-914d-b03cccb0272f	t
dc9be43b-8068-492e-a0f5-9d96e465557c	aa898c53-8064-4a3c-87ff-2759bc55813a	f
dc9be43b-8068-492e-a0f5-9d96e465557c	a9dc70ea-284e-430e-bf27-23bed1b9038f	f
dc9be43b-8068-492e-a0f5-9d96e465557c	9163e38c-4fc7-48cd-a7f0-62e0bc6ee764	f
dc9be43b-8068-492e-a0f5-9d96e465557c	ed47a062-505e-4cbd-a35d-853b905165d5	f
7d83e93d-0083-4e82-994f-2da2b7a5ac46	8a451c75-1e82-40c8-844c-effc3e8997da	t
7d83e93d-0083-4e82-994f-2da2b7a5ac46	feb05054-e00e-4eae-ae2b-2aacad60ff56	t
7d83e93d-0083-4e82-994f-2da2b7a5ac46	b2a098b6-354a-4122-b4dd-6deaf75c826c	t
7d83e93d-0083-4e82-994f-2da2b7a5ac46	ac7833ff-d882-4714-a621-65ff8913ce37	t
7d83e93d-0083-4e82-994f-2da2b7a5ac46	5edcf47d-a0a6-49ad-914d-b03cccb0272f	t
7d83e93d-0083-4e82-994f-2da2b7a5ac46	aa898c53-8064-4a3c-87ff-2759bc55813a	f
7d83e93d-0083-4e82-994f-2da2b7a5ac46	a9dc70ea-284e-430e-bf27-23bed1b9038f	f
7d83e93d-0083-4e82-994f-2da2b7a5ac46	9163e38c-4fc7-48cd-a7f0-62e0bc6ee764	f
7d83e93d-0083-4e82-994f-2da2b7a5ac46	ed47a062-505e-4cbd-a35d-853b905165d5	f
865f4804-4069-4a4c-b155-9a16686c3465	7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	t
865f4804-4069-4a4c-b155-9a16686c3465	aeb4cff8-2781-4f07-9965-7cce39afb2e2	t
865f4804-4069-4a4c-b155-9a16686c3465	fa1609b7-8e09-4b8a-8cba-074a6f174fdc	t
865f4804-4069-4a4c-b155-9a16686c3465	bf1fe07f-6faa-432a-aa64-57dbf2bcb443	t
865f4804-4069-4a4c-b155-9a16686c3465	f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	t
865f4804-4069-4a4c-b155-9a16686c3465	a980e909-9ebc-42f0-b919-273f948c9e53	f
865f4804-4069-4a4c-b155-9a16686c3465	fc6fbe06-c104-4561-9fe3-74486bb46212	f
865f4804-4069-4a4c-b155-9a16686c3465	7241ba22-96f1-45ff-8497-ae6343f7cc91	f
865f4804-4069-4a4c-b155-9a16686c3465	80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	f
2682a4aa-1e30-4d13-bd52-67435bb29ac2	7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	t
2682a4aa-1e30-4d13-bd52-67435bb29ac2	aeb4cff8-2781-4f07-9965-7cce39afb2e2	t
2682a4aa-1e30-4d13-bd52-67435bb29ac2	fa1609b7-8e09-4b8a-8cba-074a6f174fdc	t
2682a4aa-1e30-4d13-bd52-67435bb29ac2	bf1fe07f-6faa-432a-aa64-57dbf2bcb443	t
2682a4aa-1e30-4d13-bd52-67435bb29ac2	f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	t
2682a4aa-1e30-4d13-bd52-67435bb29ac2	a980e909-9ebc-42f0-b919-273f948c9e53	f
2682a4aa-1e30-4d13-bd52-67435bb29ac2	fc6fbe06-c104-4561-9fe3-74486bb46212	f
2682a4aa-1e30-4d13-bd52-67435bb29ac2	7241ba22-96f1-45ff-8497-ae6343f7cc91	f
2682a4aa-1e30-4d13-bd52-67435bb29ac2	80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	f
1ea1462b-cbda-4d95-a67d-fcba03a8c495	7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	t
1ea1462b-cbda-4d95-a67d-fcba03a8c495	aeb4cff8-2781-4f07-9965-7cce39afb2e2	t
1ea1462b-cbda-4d95-a67d-fcba03a8c495	fa1609b7-8e09-4b8a-8cba-074a6f174fdc	t
1ea1462b-cbda-4d95-a67d-fcba03a8c495	bf1fe07f-6faa-432a-aa64-57dbf2bcb443	t
1ea1462b-cbda-4d95-a67d-fcba03a8c495	f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	t
1ea1462b-cbda-4d95-a67d-fcba03a8c495	a980e909-9ebc-42f0-b919-273f948c9e53	f
1ea1462b-cbda-4d95-a67d-fcba03a8c495	fc6fbe06-c104-4561-9fe3-74486bb46212	f
1ea1462b-cbda-4d95-a67d-fcba03a8c495	7241ba22-96f1-45ff-8497-ae6343f7cc91	f
1ea1462b-cbda-4d95-a67d-fcba03a8c495	80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	f
0de05ff6-b163-43ce-b5a7-aa4e3a1d62ec	7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	t
0de05ff6-b163-43ce-b5a7-aa4e3a1d62ec	aeb4cff8-2781-4f07-9965-7cce39afb2e2	t
0de05ff6-b163-43ce-b5a7-aa4e3a1d62ec	fa1609b7-8e09-4b8a-8cba-074a6f174fdc	t
0de05ff6-b163-43ce-b5a7-aa4e3a1d62ec	bf1fe07f-6faa-432a-aa64-57dbf2bcb443	t
0de05ff6-b163-43ce-b5a7-aa4e3a1d62ec	f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	t
0de05ff6-b163-43ce-b5a7-aa4e3a1d62ec	a980e909-9ebc-42f0-b919-273f948c9e53	f
0de05ff6-b163-43ce-b5a7-aa4e3a1d62ec	fc6fbe06-c104-4561-9fe3-74486bb46212	f
0de05ff6-b163-43ce-b5a7-aa4e3a1d62ec	7241ba22-96f1-45ff-8497-ae6343f7cc91	f
0de05ff6-b163-43ce-b5a7-aa4e3a1d62ec	80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	f
c84f053d-bd16-440b-b90c-2d3eabed8ea5	7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	t
c84f053d-bd16-440b-b90c-2d3eabed8ea5	aeb4cff8-2781-4f07-9965-7cce39afb2e2	t
c84f053d-bd16-440b-b90c-2d3eabed8ea5	fa1609b7-8e09-4b8a-8cba-074a6f174fdc	t
c84f053d-bd16-440b-b90c-2d3eabed8ea5	bf1fe07f-6faa-432a-aa64-57dbf2bcb443	t
c84f053d-bd16-440b-b90c-2d3eabed8ea5	f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	t
c84f053d-bd16-440b-b90c-2d3eabed8ea5	a980e909-9ebc-42f0-b919-273f948c9e53	f
c84f053d-bd16-440b-b90c-2d3eabed8ea5	fc6fbe06-c104-4561-9fe3-74486bb46212	f
c84f053d-bd16-440b-b90c-2d3eabed8ea5	7241ba22-96f1-45ff-8497-ae6343f7cc91	f
c84f053d-bd16-440b-b90c-2d3eabed8ea5	80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	f
c1a4b05c-5a99-4092-9593-2081bc7a1c30	7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	t
c1a4b05c-5a99-4092-9593-2081bc7a1c30	aeb4cff8-2781-4f07-9965-7cce39afb2e2	t
c1a4b05c-5a99-4092-9593-2081bc7a1c30	fa1609b7-8e09-4b8a-8cba-074a6f174fdc	t
c1a4b05c-5a99-4092-9593-2081bc7a1c30	bf1fe07f-6faa-432a-aa64-57dbf2bcb443	t
c1a4b05c-5a99-4092-9593-2081bc7a1c30	f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	t
c1a4b05c-5a99-4092-9593-2081bc7a1c30	a980e909-9ebc-42f0-b919-273f948c9e53	f
c1a4b05c-5a99-4092-9593-2081bc7a1c30	fc6fbe06-c104-4561-9fe3-74486bb46212	f
c1a4b05c-5a99-4092-9593-2081bc7a1c30	7241ba22-96f1-45ff-8497-ae6343f7cc91	f
c1a4b05c-5a99-4092-9593-2081bc7a1c30	80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	f
4beaf17c-a463-4896-9314-a4b22bd894b5	7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	t
4beaf17c-a463-4896-9314-a4b22bd894b5	aeb4cff8-2781-4f07-9965-7cce39afb2e2	t
4beaf17c-a463-4896-9314-a4b22bd894b5	fa1609b7-8e09-4b8a-8cba-074a6f174fdc	t
4beaf17c-a463-4896-9314-a4b22bd894b5	bf1fe07f-6faa-432a-aa64-57dbf2bcb443	t
4beaf17c-a463-4896-9314-a4b22bd894b5	f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	t
4beaf17c-a463-4896-9314-a4b22bd894b5	a980e909-9ebc-42f0-b919-273f948c9e53	f
4beaf17c-a463-4896-9314-a4b22bd894b5	fc6fbe06-c104-4561-9fe3-74486bb46212	f
4beaf17c-a463-4896-9314-a4b22bd894b5	7241ba22-96f1-45ff-8497-ae6343f7cc91	f
4beaf17c-a463-4896-9314-a4b22bd894b5	80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	f
4beaf17c-a463-4896-9314-a4b22bd894b5	71427592-7de6-4d12-b8bc-f96289726cfd	t
41a1caef-08cf-47a5-80c0-98aff7ae2f33	7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	t
41a1caef-08cf-47a5-80c0-98aff7ae2f33	71427592-7de6-4d12-b8bc-f96289726cfd	t
41a1caef-08cf-47a5-80c0-98aff7ae2f33	aeb4cff8-2781-4f07-9965-7cce39afb2e2	t
41a1caef-08cf-47a5-80c0-98aff7ae2f33	fa1609b7-8e09-4b8a-8cba-074a6f174fdc	t
41a1caef-08cf-47a5-80c0-98aff7ae2f33	bf1fe07f-6faa-432a-aa64-57dbf2bcb443	t
41a1caef-08cf-47a5-80c0-98aff7ae2f33	f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	t
41a1caef-08cf-47a5-80c0-98aff7ae2f33	a980e909-9ebc-42f0-b919-273f948c9e53	f
41a1caef-08cf-47a5-80c0-98aff7ae2f33	fc6fbe06-c104-4561-9fe3-74486bb46212	f
41a1caef-08cf-47a5-80c0-98aff7ae2f33	7241ba22-96f1-45ff-8497-ae6343f7cc91	f
41a1caef-08cf-47a5-80c0-98aff7ae2f33	80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	f
41a1caef-08cf-47a5-80c0-98aff7ae2f33	894a7511-1ee9-4f9e-ae42-99a2db2a66d7	t
41a1caef-08cf-47a5-80c0-98aff7ae2f33	2dbf443b-c04b-46e2-b341-82f7bd298ce0	t
ab24de49-f9f2-4708-8f42-3c51040d035b	ac1492d2-e3bd-4242-affe-f372e109f284	t
ab24de49-f9f2-4708-8f42-3c51040d035b	57e8e861-c01e-444a-b017-939b46021f12	t
ab24de49-f9f2-4708-8f42-3c51040d035b	c0d0b991-495b-4484-bc1f-24edcf8a7fca	t
ab24de49-f9f2-4708-8f42-3c51040d035b	973b4773-66e0-4036-903e-922011f627b9	t
ab24de49-f9f2-4708-8f42-3c51040d035b	03d185fa-0e2a-47af-a2da-cd4b600619b6	t
ab24de49-f9f2-4708-8f42-3c51040d035b	dc866a59-7994-42f6-9625-4c5a2705e00d	f
ab24de49-f9f2-4708-8f42-3c51040d035b	120b2b69-b8a2-4380-9cd9-3cb49886a804	f
ab24de49-f9f2-4708-8f42-3c51040d035b	c054c6af-66f1-4a65-b61d-d0ba709be07e	f
ab24de49-f9f2-4708-8f42-3c51040d035b	8e6883b3-ba8d-4ef6-97b2-092673d11aed	f
35bf4270-3a4c-4caf-9241-b183b0a838fe	ac1492d2-e3bd-4242-affe-f372e109f284	t
35bf4270-3a4c-4caf-9241-b183b0a838fe	57e8e861-c01e-444a-b017-939b46021f12	t
35bf4270-3a4c-4caf-9241-b183b0a838fe	c0d0b991-495b-4484-bc1f-24edcf8a7fca	t
35bf4270-3a4c-4caf-9241-b183b0a838fe	973b4773-66e0-4036-903e-922011f627b9	t
35bf4270-3a4c-4caf-9241-b183b0a838fe	03d185fa-0e2a-47af-a2da-cd4b600619b6	t
35bf4270-3a4c-4caf-9241-b183b0a838fe	dc866a59-7994-42f6-9625-4c5a2705e00d	f
35bf4270-3a4c-4caf-9241-b183b0a838fe	120b2b69-b8a2-4380-9cd9-3cb49886a804	f
35bf4270-3a4c-4caf-9241-b183b0a838fe	c054c6af-66f1-4a65-b61d-d0ba709be07e	f
35bf4270-3a4c-4caf-9241-b183b0a838fe	8e6883b3-ba8d-4ef6-97b2-092673d11aed	f
dd698d64-d69b-42cb-b259-6b77b3f79593	ac1492d2-e3bd-4242-affe-f372e109f284	t
dd698d64-d69b-42cb-b259-6b77b3f79593	57e8e861-c01e-444a-b017-939b46021f12	t
dd698d64-d69b-42cb-b259-6b77b3f79593	c0d0b991-495b-4484-bc1f-24edcf8a7fca	t
dd698d64-d69b-42cb-b259-6b77b3f79593	973b4773-66e0-4036-903e-922011f627b9	t
dd698d64-d69b-42cb-b259-6b77b3f79593	03d185fa-0e2a-47af-a2da-cd4b600619b6	t
dd698d64-d69b-42cb-b259-6b77b3f79593	dc866a59-7994-42f6-9625-4c5a2705e00d	f
dd698d64-d69b-42cb-b259-6b77b3f79593	120b2b69-b8a2-4380-9cd9-3cb49886a804	f
dd698d64-d69b-42cb-b259-6b77b3f79593	c054c6af-66f1-4a65-b61d-d0ba709be07e	f
dd698d64-d69b-42cb-b259-6b77b3f79593	8e6883b3-ba8d-4ef6-97b2-092673d11aed	f
375b8a4c-a514-4211-9300-6ccd36393276	ac1492d2-e3bd-4242-affe-f372e109f284	t
375b8a4c-a514-4211-9300-6ccd36393276	57e8e861-c01e-444a-b017-939b46021f12	t
375b8a4c-a514-4211-9300-6ccd36393276	c0d0b991-495b-4484-bc1f-24edcf8a7fca	t
375b8a4c-a514-4211-9300-6ccd36393276	973b4773-66e0-4036-903e-922011f627b9	t
375b8a4c-a514-4211-9300-6ccd36393276	03d185fa-0e2a-47af-a2da-cd4b600619b6	t
375b8a4c-a514-4211-9300-6ccd36393276	dc866a59-7994-42f6-9625-4c5a2705e00d	f
375b8a4c-a514-4211-9300-6ccd36393276	120b2b69-b8a2-4380-9cd9-3cb49886a804	f
375b8a4c-a514-4211-9300-6ccd36393276	c054c6af-66f1-4a65-b61d-d0ba709be07e	f
375b8a4c-a514-4211-9300-6ccd36393276	8e6883b3-ba8d-4ef6-97b2-092673d11aed	f
6120afa1-0dce-4ec7-8fb5-74c7cf94a938	ac1492d2-e3bd-4242-affe-f372e109f284	t
6120afa1-0dce-4ec7-8fb5-74c7cf94a938	57e8e861-c01e-444a-b017-939b46021f12	t
6120afa1-0dce-4ec7-8fb5-74c7cf94a938	c0d0b991-495b-4484-bc1f-24edcf8a7fca	t
6120afa1-0dce-4ec7-8fb5-74c7cf94a938	973b4773-66e0-4036-903e-922011f627b9	t
6120afa1-0dce-4ec7-8fb5-74c7cf94a938	03d185fa-0e2a-47af-a2da-cd4b600619b6	t
6120afa1-0dce-4ec7-8fb5-74c7cf94a938	dc866a59-7994-42f6-9625-4c5a2705e00d	f
6120afa1-0dce-4ec7-8fb5-74c7cf94a938	120b2b69-b8a2-4380-9cd9-3cb49886a804	f
6120afa1-0dce-4ec7-8fb5-74c7cf94a938	c054c6af-66f1-4a65-b61d-d0ba709be07e	f
6120afa1-0dce-4ec7-8fb5-74c7cf94a938	8e6883b3-ba8d-4ef6-97b2-092673d11aed	f
12215ae6-3f08-4e58-b662-ff85df0effb1	ac1492d2-e3bd-4242-affe-f372e109f284	t
12215ae6-3f08-4e58-b662-ff85df0effb1	57e8e861-c01e-444a-b017-939b46021f12	t
12215ae6-3f08-4e58-b662-ff85df0effb1	c0d0b991-495b-4484-bc1f-24edcf8a7fca	t
12215ae6-3f08-4e58-b662-ff85df0effb1	973b4773-66e0-4036-903e-922011f627b9	t
12215ae6-3f08-4e58-b662-ff85df0effb1	03d185fa-0e2a-47af-a2da-cd4b600619b6	t
12215ae6-3f08-4e58-b662-ff85df0effb1	dc866a59-7994-42f6-9625-4c5a2705e00d	f
12215ae6-3f08-4e58-b662-ff85df0effb1	120b2b69-b8a2-4380-9cd9-3cb49886a804	f
12215ae6-3f08-4e58-b662-ff85df0effb1	c054c6af-66f1-4a65-b61d-d0ba709be07e	f
12215ae6-3f08-4e58-b662-ff85df0effb1	8e6883b3-ba8d-4ef6-97b2-092673d11aed	f
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	ac1492d2-e3bd-4242-affe-f372e109f284	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	0287610d-5a4f-4818-84e1-b1a9c0b8e914	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	57e8e861-c01e-444a-b017-939b46021f12	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	c0d0b991-495b-4484-bc1f-24edcf8a7fca	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	973b4773-66e0-4036-903e-922011f627b9	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	03d185fa-0e2a-47af-a2da-cd4b600619b6	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	dc866a59-7994-42f6-9625-4c5a2705e00d	f
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	120b2b69-b8a2-4380-9cd9-3cb49886a804	f
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	c054c6af-66f1-4a65-b61d-d0ba709be07e	f
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	8e6883b3-ba8d-4ef6-97b2-092673d11aed	f
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	99bf78ca-c748-4846-88ba-c829dbedcba0	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	f4c6c4b5-b7a6-4bb4-8eb3-3dad37064741	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	00bf4cec-949b-4725-9277-0e64219a6ffc	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	6f886051-b217-4e14-9f52-7a7b30e2f47e	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	9d05b36e-dd7c-4980-b974-834f78aae1f9	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	ca9ecc5b-1a1e-4431-9835-9612e24a660f	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	aa02a150-384e-4574-9f0f-844847b2397d	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	73014569-6884-40b6-a0bf-83e3560f9ee5	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	6b5ae4d9-135f-4c09-875e-a9314338f847	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	f00cc02d-3685-4a80-ab60-807977e25269	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	4d2dee30-44e9-47ba-9a61-24911ce5575f	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	d63dac92-75f1-45ce-8df5-85b25ca56e84	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	196b6d76-880c-43b7-99c4-7e171a4177bf	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	ec15f768-3f29-4ec3-9030-62dfcb9491e3	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	e203eb9b-87ef-41f3-bb70-6cf0519cf09a	t
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	096c8c1f-dacf-4ec4-a9e2-18dd3ec7445a	t
dc94d641-7e97-455e-970b-f3e58ae7eb03	a1ed248a-e826-4058-9919-32a365698eb2	t
dc94d641-7e97-455e-970b-f3e58ae7eb03	3e197c3e-4383-4fda-bdd7-51c57f4cb087	t
dc94d641-7e97-455e-970b-f3e58ae7eb03	0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	t
dc94d641-7e97-455e-970b-f3e58ae7eb03	6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd	t
dc94d641-7e97-455e-970b-f3e58ae7eb03	8eb116e9-672d-4906-af77-9d4005fb7bc9	t
dc94d641-7e97-455e-970b-f3e58ae7eb03	9bf965e9-5b33-499e-93a9-a51b92d82d49	f
dc94d641-7e97-455e-970b-f3e58ae7eb03	f7a19d3c-7e9c-4b6c-b123-aa14d4581a24	f
dc94d641-7e97-455e-970b-f3e58ae7eb03	1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	f
dc94d641-7e97-455e-970b-f3e58ae7eb03	90db1804-b170-4b99-be1d-64a8a40514a2	f
748c182c-60f3-47cd-bcad-e836a4ae5090	a1ed248a-e826-4058-9919-32a365698eb2	t
748c182c-60f3-47cd-bcad-e836a4ae5090	3e197c3e-4383-4fda-bdd7-51c57f4cb087	t
748c182c-60f3-47cd-bcad-e836a4ae5090	0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	t
748c182c-60f3-47cd-bcad-e836a4ae5090	6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd	t
748c182c-60f3-47cd-bcad-e836a4ae5090	8eb116e9-672d-4906-af77-9d4005fb7bc9	t
748c182c-60f3-47cd-bcad-e836a4ae5090	9bf965e9-5b33-499e-93a9-a51b92d82d49	f
748c182c-60f3-47cd-bcad-e836a4ae5090	f7a19d3c-7e9c-4b6c-b123-aa14d4581a24	f
748c182c-60f3-47cd-bcad-e836a4ae5090	1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	f
748c182c-60f3-47cd-bcad-e836a4ae5090	90db1804-b170-4b99-be1d-64a8a40514a2	f
6e2d024f-ac1f-4f1e-b7c4-7523e06ade2c	a1ed248a-e826-4058-9919-32a365698eb2	t
6e2d024f-ac1f-4f1e-b7c4-7523e06ade2c	3e197c3e-4383-4fda-bdd7-51c57f4cb087	t
6e2d024f-ac1f-4f1e-b7c4-7523e06ade2c	0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	t
6e2d024f-ac1f-4f1e-b7c4-7523e06ade2c	6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd	t
6e2d024f-ac1f-4f1e-b7c4-7523e06ade2c	8eb116e9-672d-4906-af77-9d4005fb7bc9	t
6e2d024f-ac1f-4f1e-b7c4-7523e06ade2c	9bf965e9-5b33-499e-93a9-a51b92d82d49	f
6e2d024f-ac1f-4f1e-b7c4-7523e06ade2c	f7a19d3c-7e9c-4b6c-b123-aa14d4581a24	f
6e2d024f-ac1f-4f1e-b7c4-7523e06ade2c	1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	f
6e2d024f-ac1f-4f1e-b7c4-7523e06ade2c	90db1804-b170-4b99-be1d-64a8a40514a2	f
0a438640-c32b-466a-99b8-536c23169b1f	a1ed248a-e826-4058-9919-32a365698eb2	t
0a438640-c32b-466a-99b8-536c23169b1f	3e197c3e-4383-4fda-bdd7-51c57f4cb087	t
0a438640-c32b-466a-99b8-536c23169b1f	0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	t
0a438640-c32b-466a-99b8-536c23169b1f	6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd	t
0a438640-c32b-466a-99b8-536c23169b1f	8eb116e9-672d-4906-af77-9d4005fb7bc9	t
0a438640-c32b-466a-99b8-536c23169b1f	9bf965e9-5b33-499e-93a9-a51b92d82d49	f
0a438640-c32b-466a-99b8-536c23169b1f	f7a19d3c-7e9c-4b6c-b123-aa14d4581a24	f
0a438640-c32b-466a-99b8-536c23169b1f	1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	f
0a438640-c32b-466a-99b8-536c23169b1f	90db1804-b170-4b99-be1d-64a8a40514a2	f
3ff011b8-ea83-42ee-a1c7-9fd2a477073d	a1ed248a-e826-4058-9919-32a365698eb2	t
3ff011b8-ea83-42ee-a1c7-9fd2a477073d	3e197c3e-4383-4fda-bdd7-51c57f4cb087	t
3ff011b8-ea83-42ee-a1c7-9fd2a477073d	0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	t
3ff011b8-ea83-42ee-a1c7-9fd2a477073d	6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd	t
3ff011b8-ea83-42ee-a1c7-9fd2a477073d	8eb116e9-672d-4906-af77-9d4005fb7bc9	t
3ff011b8-ea83-42ee-a1c7-9fd2a477073d	9bf965e9-5b33-499e-93a9-a51b92d82d49	f
3ff011b8-ea83-42ee-a1c7-9fd2a477073d	f7a19d3c-7e9c-4b6c-b123-aa14d4581a24	f
3ff011b8-ea83-42ee-a1c7-9fd2a477073d	1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	f
3ff011b8-ea83-42ee-a1c7-9fd2a477073d	90db1804-b170-4b99-be1d-64a8a40514a2	f
b5858d86-6a83-43ba-a4b0-a0dd5e663059	a1ed248a-e826-4058-9919-32a365698eb2	t
b5858d86-6a83-43ba-a4b0-a0dd5e663059	3e197c3e-4383-4fda-bdd7-51c57f4cb087	t
b5858d86-6a83-43ba-a4b0-a0dd5e663059	0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	t
b5858d86-6a83-43ba-a4b0-a0dd5e663059	6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd	t
b5858d86-6a83-43ba-a4b0-a0dd5e663059	8eb116e9-672d-4906-af77-9d4005fb7bc9	t
b5858d86-6a83-43ba-a4b0-a0dd5e663059	9bf965e9-5b33-499e-93a9-a51b92d82d49	f
b5858d86-6a83-43ba-a4b0-a0dd5e663059	f7a19d3c-7e9c-4b6c-b123-aa14d4581a24	f
b5858d86-6a83-43ba-a4b0-a0dd5e663059	1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	f
b5858d86-6a83-43ba-a4b0-a0dd5e663059	90db1804-b170-4b99-be1d-64a8a40514a2	f
6abdd522-ccc5-4de9-88eb-83c8366acdc2	a1ed248a-e826-4058-9919-32a365698eb2	t
6abdd522-ccc5-4de9-88eb-83c8366acdc2	3e197c3e-4383-4fda-bdd7-51c57f4cb087	t
6abdd522-ccc5-4de9-88eb-83c8366acdc2	0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	t
6abdd522-ccc5-4de9-88eb-83c8366acdc2	6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd	t
6abdd522-ccc5-4de9-88eb-83c8366acdc2	8eb116e9-672d-4906-af77-9d4005fb7bc9	t
6abdd522-ccc5-4de9-88eb-83c8366acdc2	9bf965e9-5b33-499e-93a9-a51b92d82d49	f
6abdd522-ccc5-4de9-88eb-83c8366acdc2	f7a19d3c-7e9c-4b6c-b123-aa14d4581a24	f
6abdd522-ccc5-4de9-88eb-83c8366acdc2	1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	f
6abdd522-ccc5-4de9-88eb-83c8366acdc2	90db1804-b170-4b99-be1d-64a8a40514a2	f
6abdd522-ccc5-4de9-88eb-83c8366acdc2	4c190d2f-aba2-4230-ba17-e5cdeed39c21	t
6abdd522-ccc5-4de9-88eb-83c8366acdc2	3121e21e-0b05-4b74-8710-fd97bdeb03ce	t
6abdd522-ccc5-4de9-88eb-83c8366acdc2	c0f52a89-0999-433f-812c-f924e13dfde2	t
6abdd522-ccc5-4de9-88eb-83c8366acdc2	6e7c245c-a1ba-4a52-a6ce-52626366650f	t
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	8a451c75-1e82-40c8-844c-effc3e8997da	t
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	feb05054-e00e-4eae-ae2b-2aacad60ff56	t
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	b2a098b6-354a-4122-b4dd-6deaf75c826c	t
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	ac7833ff-d882-4714-a621-65ff8913ce37	t
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	5edcf47d-a0a6-49ad-914d-b03cccb0272f	t
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	aa898c53-8064-4a3c-87ff-2759bc55813a	f
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	a9dc70ea-284e-430e-bf27-23bed1b9038f	f
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	9163e38c-4fc7-48cd-a7f0-62e0bc6ee764	f
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	ed47a062-505e-4cbd-a35d-853b905165d5	f
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	t
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	71427592-7de6-4d12-b8bc-f96289726cfd	t
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	aeb4cff8-2781-4f07-9965-7cce39afb2e2	t
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	fa1609b7-8e09-4b8a-8cba-074a6f174fdc	t
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	bf1fe07f-6faa-432a-aa64-57dbf2bcb443	t
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	t
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	a980e909-9ebc-42f0-b919-273f948c9e53	f
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	fc6fbe06-c104-4561-9fe3-74486bb46212	f
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	7241ba22-96f1-45ff-8497-ae6343f7cc91	f
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	f
a09f6280-72d4-41eb-8043-78a465df485b	7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	t
a09f6280-72d4-41eb-8043-78a465df485b	71427592-7de6-4d12-b8bc-f96289726cfd	t
a09f6280-72d4-41eb-8043-78a465df485b	aeb4cff8-2781-4f07-9965-7cce39afb2e2	t
a09f6280-72d4-41eb-8043-78a465df485b	fa1609b7-8e09-4b8a-8cba-074a6f174fdc	t
a09f6280-72d4-41eb-8043-78a465df485b	bf1fe07f-6faa-432a-aa64-57dbf2bcb443	t
a09f6280-72d4-41eb-8043-78a465df485b	f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	t
a09f6280-72d4-41eb-8043-78a465df485b	ea68e07d-9375-4f5c-84d2-5958affd9ce3	t
a09f6280-72d4-41eb-8043-78a465df485b	a980e909-9ebc-42f0-b919-273f948c9e53	f
a09f6280-72d4-41eb-8043-78a465df485b	fc6fbe06-c104-4561-9fe3-74486bb46212	f
a09f6280-72d4-41eb-8043-78a465df485b	7241ba22-96f1-45ff-8497-ae6343f7cc91	f
a09f6280-72d4-41eb-8043-78a465df485b	80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	f
3b60edca-5a67-4e90-b024-5f870858001b	a1ed248a-e826-4058-9919-32a365698eb2	t
3b60edca-5a67-4e90-b024-5f870858001b	3e197c3e-4383-4fda-bdd7-51c57f4cb087	t
3b60edca-5a67-4e90-b024-5f870858001b	0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	t
3b60edca-5a67-4e90-b024-5f870858001b	6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd	t
3b60edca-5a67-4e90-b024-5f870858001b	6e7c245c-a1ba-4a52-a6ce-52626366650f	t
3b60edca-5a67-4e90-b024-5f870858001b	8eb116e9-672d-4906-af77-9d4005fb7bc9	t
3b60edca-5a67-4e90-b024-5f870858001b	c0f52a89-0999-433f-812c-f924e13dfde2	t
3b60edca-5a67-4e90-b024-5f870858001b	9bf965e9-5b33-499e-93a9-a51b92d82d49	f
3b60edca-5a67-4e90-b024-5f870858001b	f7a19d3c-7e9c-4b6c-b123-aa14d4581a24	f
3b60edca-5a67-4e90-b024-5f870858001b	1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	f
3b60edca-5a67-4e90-b024-5f870858001b	90db1804-b170-4b99-be1d-64a8a40514a2	f
3b60edca-5a67-4e90-b024-5f870858001b	3121e21e-0b05-4b74-8710-fd97bdeb03ce	t
3b60edca-5a67-4e90-b024-5f870858001b	25def575-2d44-412e-9b07-8826dbc3ce18	t
3b60edca-5a67-4e90-b024-5f870858001b	be4ae291-0bdb-403c-a637-70ab5313253f	t
977c1cf5-951a-41d0-82d1-e78c0297d109	ac1492d2-e3bd-4242-affe-f372e109f284	t
977c1cf5-951a-41d0-82d1-e78c0297d109	57e8e861-c01e-444a-b017-939b46021f12	t
977c1cf5-951a-41d0-82d1-e78c0297d109	c0d0b991-495b-4484-bc1f-24edcf8a7fca	t
977c1cf5-951a-41d0-82d1-e78c0297d109	973b4773-66e0-4036-903e-922011f627b9	t
977c1cf5-951a-41d0-82d1-e78c0297d109	6b5ae4d9-135f-4c09-875e-a9314338f847	f
977c1cf5-951a-41d0-82d1-e78c0297d109	4d2dee30-44e9-47ba-9a61-24911ce5575f	f
977c1cf5-951a-41d0-82d1-e78c0297d109	d63dac92-75f1-45ce-8df5-85b25ca56e84	f
977c1cf5-951a-41d0-82d1-e78c0297d109	f00cc02d-3685-4a80-ab60-807977e25269	f
977c1cf5-951a-41d0-82d1-e78c0297d109	096c8c1f-dacf-4ec4-a9e2-18dd3ec7445a	f
977c1cf5-951a-41d0-82d1-e78c0297d109	9d05b36e-dd7c-4980-b974-834f78aae1f9	f
977c1cf5-951a-41d0-82d1-e78c0297d109	196b6d76-880c-43b7-99c4-7e171a4177bf	f
977c1cf5-951a-41d0-82d1-e78c0297d109	c054c6af-66f1-4a65-b61d-d0ba709be07e	f
977c1cf5-951a-41d0-82d1-e78c0297d109	f4c6c4b5-b7a6-4bb4-8eb3-3dad37064741	f
977c1cf5-951a-41d0-82d1-e78c0297d109	99bf78ca-c748-4846-88ba-c829dbedcba0	f
977c1cf5-951a-41d0-82d1-e78c0297d109	03d185fa-0e2a-47af-a2da-cd4b600619b6	f
977c1cf5-951a-41d0-82d1-e78c0297d109	73014569-6884-40b6-a0bf-83e3560f9ee5	f
977c1cf5-951a-41d0-82d1-e78c0297d109	00bf4cec-949b-4725-9277-0e64219a6ffc	f
977c1cf5-951a-41d0-82d1-e78c0297d109	dc866a59-7994-42f6-9625-4c5a2705e00d	f
977c1cf5-951a-41d0-82d1-e78c0297d109	120b2b69-b8a2-4380-9cd9-3cb49886a804	f
977c1cf5-951a-41d0-82d1-e78c0297d109	ca9ecc5b-1a1e-4431-9835-9612e24a660f	f
977c1cf5-951a-41d0-82d1-e78c0297d109	aa02a150-384e-4574-9f0f-844847b2397d	f
977c1cf5-951a-41d0-82d1-e78c0297d109	e203eb9b-87ef-41f3-bb70-6cf0519cf09a	f
977c1cf5-951a-41d0-82d1-e78c0297d109	6f886051-b217-4e14-9f52-7a7b30e2f47e	f
977c1cf5-951a-41d0-82d1-e78c0297d109	8e6883b3-ba8d-4ef6-97b2-092673d11aed	f
977c1cf5-951a-41d0-82d1-e78c0297d109	0287610d-5a4f-4818-84e1-b1a9c0b8e914	f
977c1cf5-951a-41d0-82d1-e78c0297d109	57151a45-3d35-4b24-9075-3fdf3f9545c8	t
977c1cf5-951a-41d0-82d1-e78c0297d109	ec15f768-3f29-4ec3-9030-62dfcb9491e3	t
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	a1ed248a-e826-4058-9919-32a365698eb2	t
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	3e197c3e-4383-4fda-bdd7-51c57f4cb087	t
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	t
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd	t
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	6e7c245c-a1ba-4a52-a6ce-52626366650f	t
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	8eb116e9-672d-4906-af77-9d4005fb7bc9	t
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	c0f52a89-0999-433f-812c-f924e13dfde2	t
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	9bf965e9-5b33-499e-93a9-a51b92d82d49	f
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	f7a19d3c-7e9c-4b6c-b123-aa14d4581a24	f
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	f
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	90db1804-b170-4b99-be1d-64a8a40514a2	f
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	74a91d48-7c47-42aa-8b23-c05c270d5598	t
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	3121e21e-0b05-4b74-8710-fd97bdeb03ce	t
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
aa898c53-8064-4a3c-87ff-2759bc55813a	48a32976-c284-4195-b294-368b5c711cb2
a980e909-9ebc-42f0-b919-273f948c9e53	d6613e2d-56a6-41e7-9cca-cc08b6535a89
71427592-7de6-4d12-b8bc-f96289726cfd	37182854-cfca-4b76-918f-6c58bef5ad55
71427592-7de6-4d12-b8bc-f96289726cfd	bd4fddad-a945-48f0-9ebe-d3e8e6b59b55
71427592-7de6-4d12-b8bc-f96289726cfd	58c65169-8fe0-477c-a012-2f1d2f18072e
dc866a59-7994-42f6-9625-4c5a2705e00d	d70bb390-df88-4695-ae78-0c536c755765
9bf965e9-5b33-499e-93a9-a51b92d82d49	5dcb867b-0e23-4df8-977a-2027505e10c2
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
552b5e1a-d831-463b-9b36-53723df68eed	Trusted Hosts	cb748a80-a440-40dc-ba38-53857fbff49b	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cb748a80-a440-40dc-ba38-53857fbff49b	anonymous
e6d65268-cd53-4989-8ab6-953c58e94fbc	Consent Required	cb748a80-a440-40dc-ba38-53857fbff49b	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cb748a80-a440-40dc-ba38-53857fbff49b	anonymous
3ab585ea-5be3-4854-851c-73c64635ed6b	Full Scope Disabled	cb748a80-a440-40dc-ba38-53857fbff49b	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cb748a80-a440-40dc-ba38-53857fbff49b	anonymous
e0b218eb-e254-404c-a98b-b519a169ce35	Max Clients Limit	cb748a80-a440-40dc-ba38-53857fbff49b	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cb748a80-a440-40dc-ba38-53857fbff49b	anonymous
25605121-b4b0-474d-8e87-bebe47dfaa67	Allowed Protocol Mapper Types	cb748a80-a440-40dc-ba38-53857fbff49b	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cb748a80-a440-40dc-ba38-53857fbff49b	anonymous
4b25005a-f6c5-46d8-8d90-0e578bdd24a7	Allowed Client Scopes	cb748a80-a440-40dc-ba38-53857fbff49b	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cb748a80-a440-40dc-ba38-53857fbff49b	anonymous
3d78a1bc-b5d8-4d97-ba5c-615cd0d96a9d	Allowed Protocol Mapper Types	cb748a80-a440-40dc-ba38-53857fbff49b	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cb748a80-a440-40dc-ba38-53857fbff49b	authenticated
2a989f88-fd64-4313-a395-885eba6d6013	Allowed Client Scopes	cb748a80-a440-40dc-ba38-53857fbff49b	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	cb748a80-a440-40dc-ba38-53857fbff49b	authenticated
bb6c65df-8b89-4abe-b757-d98c675b9450	rsa-generated	cb748a80-a440-40dc-ba38-53857fbff49b	rsa-generated	org.keycloak.keys.KeyProvider	cb748a80-a440-40dc-ba38-53857fbff49b	\N
7d01d07e-76d3-4e9b-bc80-1f0d261da3dc	rsa-enc-generated	cb748a80-a440-40dc-ba38-53857fbff49b	rsa-enc-generated	org.keycloak.keys.KeyProvider	cb748a80-a440-40dc-ba38-53857fbff49b	\N
943bd6be-711b-4240-afc7-aef774ef9017	hmac-generated	cb748a80-a440-40dc-ba38-53857fbff49b	hmac-generated	org.keycloak.keys.KeyProvider	cb748a80-a440-40dc-ba38-53857fbff49b	\N
a0e4a6dd-97c7-4c47-9854-1ce57cea3ffe	aes-generated	cb748a80-a440-40dc-ba38-53857fbff49b	aes-generated	org.keycloak.keys.KeyProvider	cb748a80-a440-40dc-ba38-53857fbff49b	\N
ed6fc6e5-d2c7-4e4a-bb9b-d364a53111a5	rsa-generated	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	rsa-generated	org.keycloak.keys.KeyProvider	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	\N
dc95b4b6-60a4-437f-be55-ebe1f0fe40ff	rsa-enc-generated	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	rsa-enc-generated	org.keycloak.keys.KeyProvider	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	\N
7e8696a5-b2ed-46a2-bd88-184021bf82d5	hmac-generated	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	hmac-generated	org.keycloak.keys.KeyProvider	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	\N
40929562-448e-480e-b1d4-2efe26aa8cef	aes-generated	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	aes-generated	org.keycloak.keys.KeyProvider	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	\N
365e5fa8-41aa-4b7c-b23f-9c814b297690	Trusted Hosts	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	anonymous
85db3a34-1723-4db4-8fa6-3d6d2e6e7c7f	Consent Required	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	anonymous
5d982fb2-008b-4486-936d-49cfb00402a3	Full Scope Disabled	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	anonymous
31494419-2556-4e96-9816-ea0d7b2a7328	Max Clients Limit	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	anonymous
f9db3d6c-67c2-4d67-93b9-fbb2988d9a62	Allowed Protocol Mapper Types	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	anonymous
4fda2ad8-eaf5-48c2-ba09-15b91e701603	Allowed Client Scopes	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	anonymous
6523141b-594d-4b3a-9a95-90b4290e9ab0	Allowed Protocol Mapper Types	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	authenticated
3d62ddec-27a4-47eb-bdcd-1098544b438e	Allowed Client Scopes	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	authenticated
9d973270-b0d9-44c4-b03e-0a7e3460b53c	rsa-generated	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	rsa-generated	org.keycloak.keys.KeyProvider	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	\N
b7bbc700-ec8e-4e48-9836-ae5b9ff9003b	rsa-enc-generated	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	rsa-enc-generated	org.keycloak.keys.KeyProvider	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	\N
bb5ded0d-cbdf-4c1c-ae65-b481ecc5f9d0	hmac-generated	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	hmac-generated	org.keycloak.keys.KeyProvider	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	\N
37bd7453-ccb3-4f8a-839c-fcdc85e0f788	aes-generated	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	aes-generated	org.keycloak.keys.KeyProvider	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	\N
34918069-efa1-448d-abda-11f889f1ce55	Trusted Hosts	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	anonymous
0c9a2cc9-6bbc-49c0-a035-9ed472914b62	Consent Required	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	anonymous
afeecd8c-0940-476d-a7d8-b122949b08bf	Full Scope Disabled	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	anonymous
bf59ba36-15e4-4752-97ae-49d8d9eabd2c	Max Clients Limit	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	anonymous
93c20b36-f4c1-4494-88fd-8fa17c97250d	Allowed Protocol Mapper Types	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	anonymous
08a67e23-ef71-4265-b15a-ae8c7dccce31	Allowed Client Scopes	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	anonymous
bb0983d3-5a22-47fe-8689-aa6918d9c4c3	Allowed Protocol Mapper Types	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	authenticated
dc4d28bd-8f56-4e85-b537-ed6fc13db399	Allowed Client Scopes	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	authenticated
ece73da8-3447-4175-ab23-da7f8f236cdb	rsa-generated	e8cfaa41-db82-4979-8f75-429ff43b53b9	rsa-generated	org.keycloak.keys.KeyProvider	e8cfaa41-db82-4979-8f75-429ff43b53b9	\N
cafa2a6f-7f54-4dd3-81a1-319cd239b514	rsa-enc-generated	e8cfaa41-db82-4979-8f75-429ff43b53b9	rsa-enc-generated	org.keycloak.keys.KeyProvider	e8cfaa41-db82-4979-8f75-429ff43b53b9	\N
12c90455-58f2-429e-b40b-8766801d3f77	hmac-generated	e8cfaa41-db82-4979-8f75-429ff43b53b9	hmac-generated	org.keycloak.keys.KeyProvider	e8cfaa41-db82-4979-8f75-429ff43b53b9	\N
a1f1d8ae-1386-404d-a88f-315898bfeb3b	aes-generated	e8cfaa41-db82-4979-8f75-429ff43b53b9	aes-generated	org.keycloak.keys.KeyProvider	e8cfaa41-db82-4979-8f75-429ff43b53b9	\N
b2978074-258a-4431-9a7b-2aba9513c837	Trusted Hosts	e8cfaa41-db82-4979-8f75-429ff43b53b9	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e8cfaa41-db82-4979-8f75-429ff43b53b9	anonymous
cc83ac5f-c187-4a25-8cd3-652c64b06bc0	Consent Required	e8cfaa41-db82-4979-8f75-429ff43b53b9	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e8cfaa41-db82-4979-8f75-429ff43b53b9	anonymous
65cc324a-a314-4788-ba7c-60589486c510	Full Scope Disabled	e8cfaa41-db82-4979-8f75-429ff43b53b9	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e8cfaa41-db82-4979-8f75-429ff43b53b9	anonymous
5a2acc88-cc0b-464d-83a2-a197f2af29ed	Max Clients Limit	e8cfaa41-db82-4979-8f75-429ff43b53b9	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e8cfaa41-db82-4979-8f75-429ff43b53b9	anonymous
0517ffee-1a61-454d-97de-6f6cc70afcea	Allowed Protocol Mapper Types	e8cfaa41-db82-4979-8f75-429ff43b53b9	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e8cfaa41-db82-4979-8f75-429ff43b53b9	anonymous
a26378de-6524-4363-b07c-de1a6b55241c	Allowed Client Scopes	e8cfaa41-db82-4979-8f75-429ff43b53b9	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e8cfaa41-db82-4979-8f75-429ff43b53b9	anonymous
f269850c-801d-4a2b-8273-36e6c7c98fd9	Allowed Protocol Mapper Types	e8cfaa41-db82-4979-8f75-429ff43b53b9	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e8cfaa41-db82-4979-8f75-429ff43b53b9	authenticated
e0a08aa2-78cc-4d57-a13b-bdbaa3fee425	Allowed Client Scopes	e8cfaa41-db82-4979-8f75-429ff43b53b9	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e8cfaa41-db82-4979-8f75-429ff43b53b9	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
69ec26a3-4033-49b3-8626-8c3d47f37fad	e0b218eb-e254-404c-a98b-b519a169ce35	max-clients	200
1957594e-7459-44c9-a0c2-193f6e2a09ef	25605121-b4b0-474d-8e87-bebe47dfaa67	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
31436f6b-ec7f-4e9d-a465-23cd43d77e67	25605121-b4b0-474d-8e87-bebe47dfaa67	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
24f9bfa3-97fa-4eb2-a0bc-7f4ee842af62	25605121-b4b0-474d-8e87-bebe47dfaa67	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
0c6bdb2b-a740-4b35-9c55-bc14e4f77985	25605121-b4b0-474d-8e87-bebe47dfaa67	allowed-protocol-mapper-types	saml-role-list-mapper
26539c42-c860-4265-83d6-88ec6179d317	25605121-b4b0-474d-8e87-bebe47dfaa67	allowed-protocol-mapper-types	saml-user-property-mapper
d4fb2204-10a7-4a2a-8c84-6523be46c696	25605121-b4b0-474d-8e87-bebe47dfaa67	allowed-protocol-mapper-types	oidc-address-mapper
264a3a82-536f-42d9-8e93-96e9d2d82ab9	25605121-b4b0-474d-8e87-bebe47dfaa67	allowed-protocol-mapper-types	saml-user-attribute-mapper
2d07c5cc-1ea1-48c3-a48e-7cab27b9ebfe	25605121-b4b0-474d-8e87-bebe47dfaa67	allowed-protocol-mapper-types	oidc-full-name-mapper
eaad9e84-c183-425f-8c63-813ecc09c5fa	4b25005a-f6c5-46d8-8d90-0e578bdd24a7	allow-default-scopes	true
7ab0a0cd-3b0c-45b5-8910-0292236115c1	552b5e1a-d831-463b-9b36-53723df68eed	host-sending-registration-request-must-match	true
e365a6bd-df0d-48da-a871-ada69abf9e57	552b5e1a-d831-463b-9b36-53723df68eed	client-uris-must-match	true
b2fc16f7-d2dc-4165-83a6-4875a5120689	3d78a1bc-b5d8-4d97-ba5c-615cd0d96a9d	allowed-protocol-mapper-types	oidc-full-name-mapper
c3d0357b-95db-4008-9aaa-ba559b5352b3	3d78a1bc-b5d8-4d97-ba5c-615cd0d96a9d	allowed-protocol-mapper-types	oidc-address-mapper
3fdbabf5-9136-4034-a533-c0a3087d5c24	3d78a1bc-b5d8-4d97-ba5c-615cd0d96a9d	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
716711f2-e887-4b4c-80ce-7d59382dcd43	3d78a1bc-b5d8-4d97-ba5c-615cd0d96a9d	allowed-protocol-mapper-types	saml-role-list-mapper
4907b9f7-a667-428f-b58c-f722e8f08782	3d78a1bc-b5d8-4d97-ba5c-615cd0d96a9d	allowed-protocol-mapper-types	saml-user-property-mapper
c4592a5d-17da-4d70-a9cd-d55c2f70e621	3d78a1bc-b5d8-4d97-ba5c-615cd0d96a9d	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
b23821bf-2269-4899-930e-19c093e0eb11	3d78a1bc-b5d8-4d97-ba5c-615cd0d96a9d	allowed-protocol-mapper-types	saml-user-attribute-mapper
ff61f6e5-be54-41f3-94c0-6dfa4ec91cac	3d78a1bc-b5d8-4d97-ba5c-615cd0d96a9d	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
742cbc8c-7622-4652-8cc6-eed88896660e	2a989f88-fd64-4313-a395-885eba6d6013	allow-default-scopes	true
cea07b40-4071-425c-9d5d-2db1f712d2aa	943bd6be-711b-4240-afc7-aef774ef9017	algorithm	HS256
78e1a210-9b8d-400a-a4ae-a1b24b9195fb	943bd6be-711b-4240-afc7-aef774ef9017	kid	5c23c913-1936-40f5-ad0a-f0099def1454
1945b8e7-b938-4b8b-909e-a373fc5881e3	943bd6be-711b-4240-afc7-aef774ef9017	secret	diY5JC7M9YtysaR-CRtqUUeQtrDo7jHnJ7Oehri_Q-uUgx_qzA3jPMKLC9eKmI0GsnHXkxDCFYWrATu6mIr8vA
a02d652d-b350-41d4-a7c5-21bc143ce3cb	943bd6be-711b-4240-afc7-aef774ef9017	priority	100
ecc3f106-c822-45f6-b80e-96fa88c1a9e3	bb6c65df-8b89-4abe-b757-d98c675b9450	certificate	MIICmzCCAYMCBgGL2MK9pTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMTE2MTUzMDIzWhcNMzMxMTE2MTUzMjAzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDQKaZWLXXknV/assAYoOwyaE6QkdLKWncDK+zi6gUlyGdoa8LolkpZ0Yu4Tm/4ncJGpf9wW2vaSUl4ehuFEsPTVW+1ZY/wYuvkBc3Z/zuAPmhXOfz+pmxxmRHCG4rO/3IGbja7kO+TIlhrYa403azNAL4ao4IjFu6pvtwKOdhTA16LSEEVf8nc3XnPpdeNENelZGhSKrnhbgCAR7Vkhwb3+lyQCIkzO/WPqWBtJiFINUyFRvL9oU6+Z2mHi1UavkUfiLfJ/EPlLRI6bvVa1LUtJNu1y4uo4Fpq9LQtqESg10XbaIrBwFc5383hD/njpecgA88HBQSsIsExp13c6v1TAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAKntJykJsqVuY6OtBCWUtUowvlFGFS3ebYnIlSjLuO7wnTTf40W4K4M4Hn66A2WKumHfK3RwW90r0KkKuvBRqLs25/67amfGKTwBo72pNbBI5XTz6nRBDA7ciPqBFehpp5syrRgz91IB0oG43rbdDUO+UW7FvptWNG83Z30sJcZdwCoJ5f1qm5I+ra3rvBi2b8zYQTiYR4l8Ee+NxvpnL0Zdm1YVLZRDOKXfDQYKlzdc8ZA4whaxtQlxbMq2Wnj07yakq/ou/J1SrJNz989yh3e5W4biNriU74YwwrDZut4/u2PZlsg2uGsUQEGuYrq/ODcRMU3pqalfUZJH268RySc=
3e4164d7-5863-48d7-bb16-25b8ad3c2d01	bb6c65df-8b89-4abe-b757-d98c675b9450	keyUse	SIG
e7ed5faa-76f4-46fd-adc7-d2eab6708187	bb6c65df-8b89-4abe-b757-d98c675b9450	privateKey	MIIEowIBAAKCAQEA0CmmVi115J1f2rLAGKDsMmhOkJHSylp3Ayvs4uoFJchnaGvC6JZKWdGLuE5v+J3CRqX/cFtr2klJeHobhRLD01VvtWWP8GLr5AXN2f87gD5oVzn8/qZscZkRwhuKzv9yBm42u5DvkyJYa2GuNN2szQC+GqOCIxbuqb7cCjnYUwNei0hBFX/J3N15z6XXjRDXpWRoUiq54W4AgEe1ZIcG9/pckAiJMzv1j6lgbSYhSDVMhUby/aFOvmdph4tVGr5FH4i3yfxD5S0SOm71WtS1LSTbtcuLqOBaavS0LahEoNdF22iKwcBXOd/N4Q/546XnIAPPBwUErCLBMadd3Or9UwIDAQABAoIBAAfFTkLQTqLapx3kZ1xkAX0+PJSUBQDt0JyLMrwjzU5kRUv2HeAN4DerJWKbdv2acgquHrOEjimna7k2IbndgfbtLQ7h/DYWk0S/XLhjGUcHzWBYN1QQRWMWOj37RjrE+W45Bg0Jc5AUC6XyjwzFK7K5cN9QtEZ4EC/BArjVAPjUSaFVcMODmhZSUFiNW8OkzP9mLZiAQA3d6KMBvY0YhsHTgBTnoOOSLQBbPWtxY5wEnDZDpX23Z1AOgzO1qY7BtM0CMgIoZH96RkkY4X5JOs91k1J7W4OYqkSx9sNb4Yg6noSgxueuod2PQ+VM041Woh8e2j5s7kGHfAb352ymJqECgYEA7ENXe0C8Pz4pB1GEMTpq2fMq71c4Tj3yPQyypvhZ1BUmVWmLjFgD6+V/M4IQ8dWx4vVxX1VQkG+Ob2lSz2FTvC/Fhkux6qmSJ1ne3Zini2o+9iGN3AvLsGFdVuwbIfGZl7jC08HXGS725DiMFe+ccrLV0Rs3W40YmAXymcej8CECgYEA4Y1cfRyPeQxt9IVh6tyA/HjPvDE38o8HxT08KMGoot2Rv6OqyfsTJROrD+oBCWuwVLMPamRCMgsPQftj3gxeE6pweWVYJQgKsnAO5/kkGguvxNIrKk7YF5wCd4n/uhYIf2NV+eu2OcjeZrIDnj8LPOOHhmTaTZDqFT3rqRSkTvMCgYBhSCU4SeJ5Q/YO3mDJCF3A2mB+ZnJ3vQgGXTkeiTormn3LQ4dDRWZv9nJW2iJyAWSaqCeDcpSWtGh4tWx0mYWqAh2Z+4cJscLNUzLyGY47WIcOP6iyx2Safqy5QsS1SE7O6zPFj5Yq92yPcj00NxI7JCnoTQWRO9q5lhFbgpmdIQKBgEKcuBLvC2RJinOrrMZrBuEJYPiIZKiLG1ViB1FWGFK5MyEw2fC66OWLUHrrthCtMC9jjoryPyZ+Y6wt7UmXx3TxYjRH/Oc638XhGFXkG4hhqTBsjXj6PhGC7quVIuQ3O507nhmoRnH8Y8pain0Cy3PZEp5bTKmZwbgySFXwFbKHAoGBAM+9KMIG+3RtPwDiV0bHkpGcWQDCqiAViuN9dAujqpJmzbIVdN2LY9XIZn13iFAzEo/xUPWqNRcUkbUz3HBGDSvEGXnoGiltTa0ohYM4H53Nv3y8RpR2Nw94stp+vl/2tPUTR5bhz5SGk0AlOgBTx0g5QmVPktulMfiVVlRrrxxa
40f5ad95-8a83-4437-b037-cae63c79cf71	bb6c65df-8b89-4abe-b757-d98c675b9450	priority	100
9c5935be-41ad-4f66-87b9-075a4cc40f35	a0e4a6dd-97c7-4c47-9854-1ce57cea3ffe	secret	YQ7eXW8PZpclqTVsiL1FhQ
62afde76-2911-43fa-aa73-c46eabcee87d	a0e4a6dd-97c7-4c47-9854-1ce57cea3ffe	priority	100
4d60a57a-061a-4828-9b26-e4fc0b07d932	a0e4a6dd-97c7-4c47-9854-1ce57cea3ffe	kid	3069aece-809f-4534-a827-f480955ef425
6d55b68e-f047-487f-968d-3777265f0bf9	bb0983d3-5a22-47fe-8689-aa6918d9c4c3	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
5b85987d-3714-423f-9ed5-6739acb469e8	bb0983d3-5a22-47fe-8689-aa6918d9c4c3	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
052ed935-4c27-415e-b494-caaa4ce11016	bb0983d3-5a22-47fe-8689-aa6918d9c4c3	allowed-protocol-mapper-types	oidc-full-name-mapper
e1c5245a-4781-469b-a873-6f2a24c66a65	bb0983d3-5a22-47fe-8689-aa6918d9c4c3	allowed-protocol-mapper-types	saml-role-list-mapper
ef3248ca-4ceb-4540-83b2-8f47cf2d5a6a	bb0983d3-5a22-47fe-8689-aa6918d9c4c3	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
32dbcb3d-d2aa-4633-8805-f635cd608700	bb0983d3-5a22-47fe-8689-aa6918d9c4c3	allowed-protocol-mapper-types	oidc-address-mapper
9db1f42d-c0b9-4080-94bd-217ae3d4bea8	7d01d07e-76d3-4e9b-bc80-1f0d261da3dc	certificate	MIICmzCCAYMCBgGL2MK+kzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMTE2MTUzMDIzWhcNMzMxMTE2MTUzMjAzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDJtwBSgzQz79hznih3NXP7XA+GXej7ffy110EUC0LqqDvbdQ+UP+HhBA6P52YOspjQrqil83uC2+o0WIbb4aunD4p+TDqTXFidTiD1DnngrqY47dJxHP3S42aAbmt3RHUsfG53XDiXH2gqH4GVy+m8XX0yLTousG1Dq3g08ZpkU+xLq9h9Gy933MUIZ6XDybbbVJgxUp44NBv4PYkwOhAmfGMAXtRYwqchNSd/xD40sg2/B+NVs+tJRx6aOMON0hniEjb90EGHI+41zp+1Nzsi0spjyjhgYr/fzCxz9ylZNWTMKfRwhLoS+nmpIsoCJssnE02HbbGhOo6y5ZIISA2vAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHlcfDSMkpaUpufQqLwKS4uolpD65DAz1VGUs9ZYHfPR4cjPN3qPOSZ9MT+nBVROAfipix3vA8pV5rvRcaUZz+5b2sGGfJ4cU3oSv0CF3D50s5LAOyPFuY5hc9WVBlHr+BaV7WTgxLMEFLWXzsnFfOHJD1VhFQfRBEB1vEChQPGZyouljRrH+pkP7W1zbtahMpHacYNdSoFseEnfp2ZnEbKNj+szaKLCVOPOhFDE92MpqhX434eov6rs2oJdiEifYaC7GDB5HW0xQZ3+X5nE829I5HgpSdz3uGINMOSWisPc1dtVzzYwVs4J8CPrvq9RxxldJbVeiCCc1LMBi3qS4o8=
eb1d00f4-0738-4e08-ad0d-b2b184d34193	7d01d07e-76d3-4e9b-bc80-1f0d261da3dc	privateKey	MIIEpQIBAAKCAQEAybcAUoM0M+/Yc54odzVz+1wPhl3o+338tddBFAtC6qg723UPlD/h4QQOj+dmDrKY0K6opfN7gtvqNFiG2+Grpw+Kfkw6k1xYnU4g9Q554K6mOO3ScRz90uNmgG5rd0R1LHxud1w4lx9oKh+BlcvpvF19Mi06LrBtQ6t4NPGaZFPsS6vYfRsvd9zFCGelw8m221SYMVKeODQb+D2JMDoQJnxjAF7UWMKnITUnf8Q+NLINvwfjVbPrSUcemjjDjdIZ4hI2/dBBhyPuNc6ftTc7ItLKY8o4YGK/38wsc/cpWTVkzCn0cIS6Evp5qSLKAibLJxNNh22xoTqOsuWSCEgNrwIDAQABAoIBAEBic61iqKp9P3sj++mU+7i7GU97sS5498048FJMB+drnHN/iWH6BAi1KUrAgwBk/Eb7wOP7dCyAMmDT8vPDM+2Gld+bSEUaAETxl65wmPFg/biFHJszNEd4gxKybAXtKXNyIjZiDsQZ578uQEgGhswzkQ8PhZc6hB3J4PwRNAUafUmzy3WdRJQvJHAH+A63tcCnqHLM9De9PpE24oGjgr1oA9osDMROnDg9S6DRByd9gpLhEYxQz0JSkfT2LQ9RlGXIGcrkqfEY5soPhixHp947xzZBlMUS3MVWQeUUkbQX6MPso49ms7/mZ9febXyJAmXCkgqDMWUoq1dJkbz3UbkCgYEA7T8+99HkXMzz4GrQctYFCo8RCufwMes0DoOabnkwwnaAepPlg1CjA1Wx+qBQXXeZCrvstoYFnMeHv+Jdz//d7RiQ4TcSLlQaf2D+U9UDtAzTkkYYUJPQrSR3DtE2HDfzgwCMRATBEgv51drchFO4q4/BWEbv8Y304zYu7E0XwDcCgYEA2ajAi/C5GZGiuBE3U1nbW0J8oOeV/l7vd2NTvQh0kh34O7zPrj52MUrPxKvZbc43c/Occ6VjYPdYI6hH5L8i8iHZ5OyIq6aT09HLDK/6ymb5S/QNOZJC29LcETEVB+iOtSWtJuokgX0diW+JfCJ6DmZKAwsIa3z9M+Xy6bgEskkCgYEA7Gg+fcHINfUA+1pUtmmvglMHn395aLTAHcpj47udq9lbs0mWxaBfn94PyPdgvZKEjR6wBT1NcGmfSsTtyGtloHH/RHyVAFdMRCvJoo277/lsBfEVH437vdx9SuWMbtgOLjcojkrSfQI0BTbe0HmApmxMNIQTaveS06pVXaCAj0cCgYEA09xFZzFuCmxOlZn0X0ZUlLTXuIsS3eEsd+oPxS0owl03lXYINJOJ2hr2t3mKjy4tncifHZX7cJPxj+up5wcBDexTOlfeBC6FL6XCXdwhYcfvmrW39bTfLTdGi9lZnjQITFya+Qjpdb0B9hfCHDk20zNPkTy4+l9T2qNV2ZcLwzkCgYEA4Kq/DJjNly/64Jy6eX9uPB6hJiRkisQe5c1VE3z5YcerOmOsYfBusVGpqenVc0Bn3uohPj2sLNRtI6qEiQ/+0d6FsxYvqsmtXpyorW/wsEeDBU/a/+pjtHuZTXB/kTPQKLxUPOeuhwdRAPuNc29pWufSliOgmsB3PFVh4Kg6izs=
d21e5d2e-17a8-4cce-84a7-64eac486876b	7d01d07e-76d3-4e9b-bc80-1f0d261da3dc	algorithm	RSA-OAEP
52e342e5-794c-433b-b446-219a26f1c2d4	7d01d07e-76d3-4e9b-bc80-1f0d261da3dc	priority	100
5e9593c9-ef18-4aa5-bd1a-e3665174d817	7d01d07e-76d3-4e9b-bc80-1f0d261da3dc	keyUse	ENC
9d400c7d-4cbd-469a-8271-9e2f68e3b233	40929562-448e-480e-b1d4-2efe26aa8cef	kid	9fd972dd-cd23-4f9a-9baa-a7f16450af37
135a0532-53bc-45c4-9b45-fca1a06d0ebd	40929562-448e-480e-b1d4-2efe26aa8cef	priority	100
f0e3ec2f-b113-4c76-af92-2a519f5d886c	40929562-448e-480e-b1d4-2efe26aa8cef	secret	wygPnkPyzHuZINtEzuSGmg
2fcdf9a1-d9c8-4cc1-a73c-9e70b6880ed5	ed6fc6e5-d2c7-4e4a-bb9b-d364a53111a5	keyUse	SIG
7cf4d31c-3134-44f1-9c0d-b9248fe0f8ac	ed6fc6e5-d2c7-4e4a-bb9b-d364a53111a5	certificate	MIICmTCCAYECBgGL2MOUHTANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAVsb2NhbDAeFw0yMzExMTYxNTMxMThaFw0zMzExMTYxNTMyNThaMBAxDjAMBgNVBAMMBWxvY2FsMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwuDh+HL5R8IQ4lctPUVg4H6nz3m3Uh9MUsP0VuQM5aaYerbMSuV3Noh26+gjidQ1rde2KtueyODxxtKbUIfWQCy1nMP/U3DKYooWogCvrKWv+f9NSrZe0wF4u+OsCWcwklFJpXNaW7ph3pXzYTte2RqUAVswkx6zvptCgotB/pv8SDDjIq5PMp+VnlJCGQCF442iFSa+fcDj1G8sfpCdQkOasw42AmpQum09CgYT+2NrOoqbfPOTjzhNe3D3Zo5QvkwzS/fKeEXAuq5k0q9WGLae3kd6cOC929c9nxQBSQlI1lkjV7bYVE0pa4PJrv2CWNX6UFGd5BNi0qUS0LxW/wIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBG6ga9IKQePIl5cP6rHtvIMr9uJmtkh21B7HuvCJOTaxvSro2oXys1/Rje91ysG21EfudsTuWFFwbBExneoXmNL7ARXUVwLqwHGx8F23CaC1oefFmy9lImRoeoUI0sPJjgFH2mZnTwwiKtJMIHelvp9FXJB0WjRU/ss82tMpy5NRKFQR1Rb0GXteHsuV1MDCIHiVG93fdxBQ2WoisX7wDDWJ7JYudMT5uZKKLN7xxqjD2qywilgCKdbrIklbmwqFQk/PWvrKRAhlcKfUil+veUcZc6EOYwqoVTqwpPFQX0mJ12H7gYswZhmj6q4zWeO0F0tKi/Ntn3Nvg+E1eX/D7y
bfd619b4-db0a-40a5-a576-4b2cd6270e90	ed6fc6e5-d2c7-4e4a-bb9b-d364a53111a5	priority	100
fcc4c273-5887-4e01-9894-25e95f0eeadc	ed6fc6e5-d2c7-4e4a-bb9b-d364a53111a5	privateKey	MIIEpQIBAAKCAQEAwuDh+HL5R8IQ4lctPUVg4H6nz3m3Uh9MUsP0VuQM5aaYerbMSuV3Noh26+gjidQ1rde2KtueyODxxtKbUIfWQCy1nMP/U3DKYooWogCvrKWv+f9NSrZe0wF4u+OsCWcwklFJpXNaW7ph3pXzYTte2RqUAVswkx6zvptCgotB/pv8SDDjIq5PMp+VnlJCGQCF442iFSa+fcDj1G8sfpCdQkOasw42AmpQum09CgYT+2NrOoqbfPOTjzhNe3D3Zo5QvkwzS/fKeEXAuq5k0q9WGLae3kd6cOC929c9nxQBSQlI1lkjV7bYVE0pa4PJrv2CWNX6UFGd5BNi0qUS0LxW/wIDAQABAoIBAAcwiGsD7t9vW55wweoDRROIiK9hBFriwwxApM3khEygAfsbrbDLrhi/HcgOnJUJVQumAYIA7+blqaCAr5s1JQ82tw04C+jrqIPMfWZE/ouGN1ZSosAxYeaIpN17BPikgR28zantdgrGobVhCdrEondXAYPaoJGk7dOyja3G7ncyqyjk0DuGJ5z7p2YDuLw/m14Z71IwdjBs+yiEXyl7OqPEXRD7Bq+LKLanugQpiN9Qt7eEzDBNWF1s/lBkIgC2eTDHXAV19xivyYwQtz0ia7ZXOLmeF5TZlbmok3g0EZ4/LaHHA4DONgTgut7P8shftk4EEUmapQaCFVIWMrago4UCgYEA8vAWVh4zH/6G1WMqr50geHSI/KC8SxuXF1IPrETMwEBP54h680CokKf59n9OqYzuFENu74LhExso1fKYl++lMdwiU9o2ocfntwt1QAx0iRzjlc9GKiIC8VwMMoARrpjx1pNd5rslsPYS3i/5Ss4mlRdJzD3jtf1Q1rg8f2CEacUCgYEAzVtIb7k/b5llPnmca2ZT4/WqVsXXxFcvyjKf6OvQTxx9/ybTCSsfsQWBBZQiZ1v0hAcGGm8whMiMySUYJDkvZlxqDqaJfs5hA1RivWqFUjS03stU+Rq8/FlKogF26mpoq0hdqGGWPKh+Zr0+1ZhY/75FHryM3K36qgON2WP4PfMCgYEAu808BzDrZtVVmIpDymSWYGf+KgV76jgW8jE+6nZ5LjnJS3ynR3r5lHI2ewbpYYsP1VxX2xH7OtDpHZOfwPzCYKwDYX00dJZcG5Xg+zVltUU+7mXAoPuP+NOmnjeA889KTQ25LpAIUCe6aEb/2YNKMkFBjIFfkiWUo5jjM7kCQ90CgYEAv8+Jg0GGrRicZpR0tCRqKzzllBNLjErbioNqtca9VYeJcG+1IpUzDsfTUYCh+eT8KO3el4ZPzVb9mUualwsK6RNcxL5tIxJlrxR8/eunB7fPUWKexeZhq1tDyLqRdjdZ+NKpGIO+Ln47Qn91V1DroET6jtESyXV/8plLP0iPMF0CgYEA0NQs7ph1vbSAoBCs3qgYgR5T7Ugt8kVMpUcKrEoO2uLP3YiA6w0CVl54ratag06ckHxrZ1BMMIsgPI9aC/e65vkOwqjXupoFo4sao06zEYMzKgAdd9W99unBwBihmnOCClutkWEhsyffvLCv3blYSsF1KKHFsZ7ddjFU2fAnETU=
275560d4-33ad-4e84-821d-df95c1718a3a	7e8696a5-b2ed-46a2-bd88-184021bf82d5	secret	tk0C33FrD_4KnEeWHAtEsAgq7hD7AfW_eNewV859NLaTMiKKEmlS2J_m5KpGziNFPeMh93LAqUw8UmzxbhSmNA
ab68df9b-a806-423f-91f3-4083b3e292cc	7e8696a5-b2ed-46a2-bd88-184021bf82d5	kid	ee02e0c8-c68b-414a-91d8-c66db44357ed
58cfdeed-f506-46ef-aa40-3fc8490c9c17	7e8696a5-b2ed-46a2-bd88-184021bf82d5	priority	100
5c12fd0e-8739-435a-be6d-3a2c3641a69c	7e8696a5-b2ed-46a2-bd88-184021bf82d5	algorithm	HS256
42110022-4167-4d5e-b4dc-ca586c3d94ef	08a67e23-ef71-4265-b15a-ae8c7dccce31	allow-default-scopes	true
75e14a66-3ab1-44d6-ad61-bc0a1a2b53d8	bf59ba36-15e4-4752-97ae-49d8d9eabd2c	max-clients	200
7368de6a-a3be-4795-860b-42675862c46b	a1f1d8ae-1386-404d-a88f-315898bfeb3b	kid	196d88b9-ed69-4c1f-9a6f-f2f1d70b0be5
17d4644b-bd80-49ad-9452-d28b1e5a1dc9	a1f1d8ae-1386-404d-a88f-315898bfeb3b	priority	100
594f2cc7-14c6-44c6-a376-7c017b41f252	a1f1d8ae-1386-404d-a88f-315898bfeb3b	secret	bL42XZzr5EDMsPx9GVgTBQ
2e9069a8-1f01-41f6-b1ce-398da958f6a0	f269850c-801d-4a2b-8273-36e6c7c98fd9	allowed-protocol-mapper-types	saml-user-attribute-mapper
5bb3126b-aa2e-4e21-8ca0-feafdd6d6835	f269850c-801d-4a2b-8273-36e6c7c98fd9	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
f3bb081a-4cee-4dfd-8503-b91357a36837	f269850c-801d-4a2b-8273-36e6c7c98fd9	allowed-protocol-mapper-types	oidc-full-name-mapper
528c785d-1a45-4ef6-8116-e9310dbde5d5	dc95b4b6-60a4-437f-be55-ebe1f0fe40ff	privateKey	MIIEpAIBAAKCAQEAwQ6AaiVoEjLZU8VX6UegGnt4Aee9TKGaQdzGBRd0jQkjXNalHkyp5swNmWbMgRdHT3TSqzL/+uy9htuYkh504xBSEWaEt225abmAEv9HQxuwcH/9IhEFmDNp1J+1gouUgcEDWe6IZOv8J8zUD+G+qCaR0A52v4gqEUs5CDudCCvtWzqtAx63PNJUR21WB99BauEgNsxKAN+ZdX2NUwvvAhhHXU0pVuKoPsbdGH3lPosnqo2HxDyr9hT6bfN2nqaL2pFfAnnlJSycnzKQyxyDGfcVlBPwGhqCE1XVmahJe72umroKYhlfpoX34HnkZkNL/MWuIT1CSzWcfQkm+EvYZwIDAQABAoIBAF4HYiRQ889pVNCoXZkReblsSZcj999LFobdsNTqB6ppuP+Oy/1l+Zqf6D+/AfweCm14yOL5hBQDGoyEiFsi2mt9l3tCI4Hzv0rvPqICFANriRRCQlhFUiQ/ZlxZLV7X/Qz1pVw4Adal2brI2MCjgukDYCGl6dB/0X161dxcrK89XHyrqDsoirF2YxetwdgNK/vgVF6rVtPVOYqNul6TnotuwhIn2qIi4WVHAJkZ5Zlqqzqf7c/jskZ6cYcNTRSKw4bwlHqz+3xizISd3VgdPJhbj5UF5Kbw6B2C7nemY+mrw2GdM9hRuFqbUoSqqzviRKyYVhJGNeUG7fxN338JZQECgYEA81RETOtbJQeOgNQy5mmSHbr9zDxn1ScKkLk0TOucllqLXbTWQdRoJSMqxsQm7CpFIpoYf1KjQxIYJQ0h/Sl4LILG6LDhjxhVhK02TnWUfQ3CgJVsroDs/CaNV7+ipFUFIUatQOAcwlTY5xbiFbaoIWsil1/DyA/m2oZPy4hyOS8CgYEAyxwR7M5btnFPd3Wo2AZgnJ76rjIWAiOFHH+pEVcGqNzTQKb5LPq8Lx7g8sikfTkZdIhY/ctpZn/Ln1fYXuFrxfxkvZMZYJHLWE2F7n4fyhO1/nhB7vwyaCrNRY/xJj3SPWfOgf0hTxKkGy55x/XyKc7evJbm3p3iLJKJ6YNIlkkCgYEA4KKMo04ryJWfUwOTMe+IOvYj02Z4nOj78ftocxKYbp2MR6fonMFQm+hJV1JCdIfZZ0ZHE1Pg8MxFif8Dv8mG7eCVbL/Om+HlISUfG3Ok74XCaB6KRNc08NtOZRG/PmJW6A9tZpT/N9BIpZ4UfeMweBmFx6VbAtjbUCXqiIWgnXUCgYA1q9c4wlcN4Odk49yYKSdCe+g2O9oA+q3kF//vKxYBbUkNnpHdxuwPb5N11HtS89G8L4OEnUne4gpGswnkGKFIEif0yHg+Qoh/bwzjNsTju02uTsztgAs554WSyjSpLFDwFQxG4UL6CC0BWciohF9XmOjW4PFlBkeMC7UR1bVKsQKBgQDE2idvnORP0ho/1rP8MB9w4rP8tC7O9yqmGnl5zSbRtKJE6pluHqlxzCTJLfLrdTRntxgeUCu9VcAX08DW9zIlomSEWKjKUO/IV24qX1YUTqlfObHIYs86my5nV6rubxENhN1LP9iuszlF7EkQor2DISOM8fX9VTX+/lc9YEQEzg==
e96f2a2d-6cb2-494f-b2f2-f67325d75d3a	dc95b4b6-60a4-437f-be55-ebe1f0fe40ff	certificate	MIICmTCCAYECBgGL2MOUXzANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAVsb2NhbDAeFw0yMzExMTYxNTMxMThaFw0zMzExMTYxNTMyNThaMBAxDjAMBgNVBAMMBWxvY2FsMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwQ6AaiVoEjLZU8VX6UegGnt4Aee9TKGaQdzGBRd0jQkjXNalHkyp5swNmWbMgRdHT3TSqzL/+uy9htuYkh504xBSEWaEt225abmAEv9HQxuwcH/9IhEFmDNp1J+1gouUgcEDWe6IZOv8J8zUD+G+qCaR0A52v4gqEUs5CDudCCvtWzqtAx63PNJUR21WB99BauEgNsxKAN+ZdX2NUwvvAhhHXU0pVuKoPsbdGH3lPosnqo2HxDyr9hT6bfN2nqaL2pFfAnnlJSycnzKQyxyDGfcVlBPwGhqCE1XVmahJe72umroKYhlfpoX34HnkZkNL/MWuIT1CSzWcfQkm+EvYZwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAVBCbXD2VuuW998pvzmP8pDLy66lqWHtoMI+ookPxJcYLzU4e6lCkjE1TRX+p1fxoLGMuWmBDEkILfP21xAXkEEnTxMUcoD0OWUYWDX2IYSoVeynxoT42J5t7etFvV597zMz/U7M0zrerArRRhryyPuPq0U/k/G1LwG19LUrepbP4yCS2uJ4p26waIvdQIaySxrB8yQ3EmZXqfYBjR5+9aGWw9M8SBfo9zvBvVLTFPhz5MxQO2D6E86/Js8l4n/EyluWOQTLf+J5la9ZqZ/wDXfPGBxD8SkGowztSR92QSmbpdQngr7Ueh8nK+okVL6Z1jogbeV0uUh6pn6yoiL4AY
30ba747f-c498-4fa8-8d4e-558d9f5753a4	dc95b4b6-60a4-437f-be55-ebe1f0fe40ff	algorithm	RSA-OAEP
c135a80a-daf8-482d-9a41-a316eb771422	dc95b4b6-60a4-437f-be55-ebe1f0fe40ff	priority	100
da2423ae-fa16-48a3-a1f5-dfc623cf2a42	dc95b4b6-60a4-437f-be55-ebe1f0fe40ff	keyUse	ENC
9e78a876-b9c2-4ecf-9191-a3b27821abb1	31494419-2556-4e96-9816-ea0d7b2a7328	max-clients	200
b35818c3-1787-4096-ab2f-eba0bae5f6f3	3d62ddec-27a4-47eb-bdcd-1098544b438e	allow-default-scopes	true
17455faa-abca-4245-8f01-61e16375cdad	4fda2ad8-eaf5-48c2-ba09-15b91e701603	allow-default-scopes	true
e88af558-83c8-48d2-9b46-d9000839e5b3	f9db3d6c-67c2-4d67-93b9-fbb2988d9a62	allowed-protocol-mapper-types	saml-role-list-mapper
a49d52ac-0f16-4e61-aac8-8313708618db	f9db3d6c-67c2-4d67-93b9-fbb2988d9a62	allowed-protocol-mapper-types	oidc-full-name-mapper
fe3e3318-3f63-4d91-9590-bdb835814604	f9db3d6c-67c2-4d67-93b9-fbb2988d9a62	allowed-protocol-mapper-types	saml-user-property-mapper
f5a9ab97-f2a0-4250-b9a6-d156d72cd1d5	f9db3d6c-67c2-4d67-93b9-fbb2988d9a62	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
8036a59a-a043-4bdc-8f42-d6cc28db3851	f9db3d6c-67c2-4d67-93b9-fbb2988d9a62	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
9187c577-9a70-4c5f-84f5-f4d57d6c8a13	f9db3d6c-67c2-4d67-93b9-fbb2988d9a62	allowed-protocol-mapper-types	saml-user-attribute-mapper
5c10c83f-dc7a-448c-b884-3e50b9edd376	f9db3d6c-67c2-4d67-93b9-fbb2988d9a62	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
f0e23d57-8cf8-46fa-8110-7fc6889b303c	f9db3d6c-67c2-4d67-93b9-fbb2988d9a62	allowed-protocol-mapper-types	oidc-address-mapper
c42c9a63-dd68-4476-b9ad-77a31243a423	365e5fa8-41aa-4b7c-b23f-9c814b297690	host-sending-registration-request-must-match	true
2416be84-47bf-479c-b865-79f4fdfbb6b0	365e5fa8-41aa-4b7c-b23f-9c814b297690	client-uris-must-match	true
a3cb2fad-c496-4800-b260-7f7ea508bf84	6523141b-594d-4b3a-9a95-90b4290e9ab0	allowed-protocol-mapper-types	saml-user-property-mapper
7b18a528-6a81-4397-ad3c-fcfb69297b96	6523141b-594d-4b3a-9a95-90b4290e9ab0	allowed-protocol-mapper-types	oidc-full-name-mapper
b77da328-b5ca-44eb-9131-27fcd6b4862e	6523141b-594d-4b3a-9a95-90b4290e9ab0	allowed-protocol-mapper-types	saml-role-list-mapper
e5715fe6-9251-4aaf-b68e-e32faebf470b	6523141b-594d-4b3a-9a95-90b4290e9ab0	allowed-protocol-mapper-types	saml-user-attribute-mapper
c2d7b725-7d31-455c-9f71-f590a86d41fe	6523141b-594d-4b3a-9a95-90b4290e9ab0	allowed-protocol-mapper-types	oidc-address-mapper
202dfb27-29b3-408c-95d8-94cfeee5a6fa	6523141b-594d-4b3a-9a95-90b4290e9ab0	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
1fcc2f5e-b033-4d0d-bec8-8fc7b090e77b	6523141b-594d-4b3a-9a95-90b4290e9ab0	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
29871659-aa85-43f9-a39e-63f0ec027a1b	6523141b-594d-4b3a-9a95-90b4290e9ab0	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
3135def2-52d5-43ea-8d9d-c26cd687ea4b	93c20b36-f4c1-4494-88fd-8fa17c97250d	allowed-protocol-mapper-types	saml-user-attribute-mapper
d673fe6b-81fc-4f67-b0b1-4e2e764389dd	93c20b36-f4c1-4494-88fd-8fa17c97250d	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
531e647e-b184-40df-b4b7-2c4a2e8ea1fe	93c20b36-f4c1-4494-88fd-8fa17c97250d	allowed-protocol-mapper-types	saml-user-property-mapper
36075c0b-ab94-4a05-be92-e5925c040c44	93c20b36-f4c1-4494-88fd-8fa17c97250d	allowed-protocol-mapper-types	saml-role-list-mapper
e865de92-2f5d-4d3a-9436-cbcb32a362e2	bb0983d3-5a22-47fe-8689-aa6918d9c4c3	allowed-protocol-mapper-types	saml-user-attribute-mapper
26553705-322d-49a4-b366-2e34b48c7ef9	bb0983d3-5a22-47fe-8689-aa6918d9c4c3	allowed-protocol-mapper-types	saml-user-property-mapper
2f12d13e-bc69-4e8c-b14d-6feb98cbbfed	b2978074-258a-4431-9a7b-2aba9513c837	client-uris-must-match	true
9382c6c3-5ea2-4cab-8e16-d96d6f642831	b2978074-258a-4431-9a7b-2aba9513c837	host-sending-registration-request-must-match	true
41117fc2-04d0-4123-a132-b91ae9072aac	5a2acc88-cc0b-464d-83a2-a197f2af29ed	max-clients	200
78c2acbf-0830-4017-88af-46c50e2cbad4	f269850c-801d-4a2b-8273-36e6c7c98fd9	allowed-protocol-mapper-types	saml-user-property-mapper
0e55a4dc-22e2-460a-9da4-d0107c6b4cbe	f269850c-801d-4a2b-8273-36e6c7c98fd9	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
a3b26b5d-f153-4109-b3e0-143e6a7f3b58	9d973270-b0d9-44c4-b03e-0a7e3460b53c	privateKey	MIIEogIBAAKCAQEAg1xGrGJN1udJ1FSQUUK8PdvQfy5YSoyqsuphTYicPtdh40d7kPNfngWBucAin2YjeRQuEsSsRAPEWqjAousbsAneRnJ4mH6JcsXIbMDgI5E+atBQr8gF8XKNLdcNv5WTJUbgbxZZHYSMiMm1oenTyBtUU67YCuAvubFSZ9h47fBuoRlz6i9fuoFz1a5eEv1P1sUcA9fvH7bWLPKw/dlntzpi9m7YH5lOWr00Cf3QytwutFCuruuyw6L8bkFNdL/yDr6OBjxVJ/K741FAfU8vE2BYXD8UtQ9QbhIBA7X433gUkIqK5Cxl+0tZUwr1t6qeO+zAKKAHTPxYhyFTeBdydwIDAQABAoIBABUwb9gDvXGiembNQ0BQZwQFbrLtO2G/IhPdOdfjZuy+GnSqhbSihXR8h+n6I7uZorQ3vJzba7xG7UgAe55sFVnGpbuwYGKc2rgQTl24mQ8zsSFSvAk21zqU01AnJfkW/BbhwXc54CMiS/cOroVRLg/T1Lzw8bmDYz9tapEEurEKwexFJFts14tYEvkQWJ/+Q94F6eWntOzCZe9JSKeNElB/dQbod+VheVyX3f5VsmmKmIf4YPfVoa6ZHD53w/Hv4AdfuaXeHVsXwxF11muKE2yGwCfol2Kc5PkadZi2Uf1DXt6NQq3IwKnZqJvV4XWdg74JM/MY7ShXYBu9dSwsU9ECgYEAt+k9a0HJkX4twRj5Yn1lbokVD0fAG/Mj0EYo972MWusJ8Gk70UNQCggw8T2gv56dtlklmRoloa0+oDYw3A/QPhkj20TtE/2uUSJMtpQ2TS6i9sm499pO6ZRP3rxNaNAsCa/kcwrk49n55TTzPAZgLg0Vha/O5nh5NtbLlTfyHZECgYEAttnI3R2fba6G6E/S6MKgLW6Hq+GHUEydzn2f3hysdukiCc7r+00NKCIibC27T1qX5fTVXGhug2G1f/v1sswELa/9NWkbvdk5so+xISFys1wh/pLCkrWGVF+y7vkbnIE5j/uiazk5mPOHqYa0zsjqBoPXJN0r1dzj41d/KrYKq4cCgYAReWzniwmu9FE+nrPbYtTHaukAWa3sOe72NCRiXbU/UkPQfv87A+1P9rVHxrZGXrjXgaLr6CsZMI/ZwyxjTHFZ5SOeCu+HzbvJY7vsQSrjrIG5dzNHAYwr73ajUDr+sYDtrrPDJo7XA3gWCjDuTCDJX17jI/BBv8Ksrj4LwJQVsQKBgDwWy+SmVHs17I2xlcz6EKt9dEZu4gnoc7+lFwFmCOM28AGrJ2+5PYaf2RIV4UVNrzdZwzgP9allVcEOawrr8r+U4zBHL1+vYD+m6v3JQSliMKW5Uwnlb5SQsnvID2PaL7F6b0CvWJdECKQUaZy+9/FWKECsEjjA038lhNvjYRRHAoGARiqrM9XLxc0yU+4ztlEAMpaNylif9KiRGxWmq9eHUWJ6wUQd2BUI1JD54oPfe0OvJpiERiOaPSYMzf9ZiMLlgLTnF/fU3MHpIWCZmjYOTYjo1swMD/Zmeq3S3TDiYFaDwBzwafpDvugHGxY7XZnvNSl/+BOfdtkT4zI8yDu5mqI=
855f408a-6c66-4723-8166-b98674b326e8	9d973270-b0d9-44c4-b03e-0a7e3460b53c	certificate	MIIClTCCAX0CBgGMOPjmzTANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANkY3MwHhcNMjMxMjA1MDc1MzA1WhcNMzMxMjA1MDc1NDQ1WjAOMQwwCgYDVQQDDANkY3MwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCDXEasYk3W50nUVJBRQrw929B/LlhKjKqy6mFNiJw+12HjR3uQ81+eBYG5wCKfZiN5FC4SxKxEA8RaqMCi6xuwCd5GcniYfolyxchswOAjkT5q0FCvyAXxco0t1w2/lZMlRuBvFlkdhIyIybWh6dPIG1RTrtgK4C+5sVJn2Hjt8G6hGXPqL1+6gXPVrl4S/U/WxRwD1+8fttYs8rD92We3OmL2btgfmU5avTQJ/dDK3C60UK6u67LDovxuQU10v/IOvo4GPFUn8rvjUUB9Ty8TYFhcPxS1D1BuEgEDtfjfeBSQiorkLGX7S1lTCvW3qp477MAooAdM/FiHIVN4F3J3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHNnFaqe0WhuktqurbsmEkNM4HzApm+aJjeKzC2OYZ/zhYun/WTicyyArELuHwpT98hy/UaAXii4aqrv2s+KnIXqNRLqQgkMHFp86JcSLLD8Hm3DbDXQbLcprID63pcEvQ+rMSwOzrJeQ6nX7HL33ciuICUhBxdB70TXtv3GNgLajC+vU//oiHiIttoZF8j67nt2bTEpRnmGaASkva3CVdDv0sfm4BL8At+eowzBiyEf8uShN8sqvJpec7PgaBYUEAg4r498EYkeEHUrBXspVhRvDJdGl8ByVu+XS3JTFirIRGZeQjL3WexSn1jRQeeSXiSfu7bQp8/Vwk6nwTchnPE=
db1610bb-d176-4db4-91c8-083e35a43264	9d973270-b0d9-44c4-b03e-0a7e3460b53c	keyUse	SIG
2e558b3e-4dff-4f29-9040-6ff0217faf22	9d973270-b0d9-44c4-b03e-0a7e3460b53c	priority	100
cb8b6f63-76df-47a1-81ae-39a952eb7649	37bd7453-ccb3-4f8a-839c-fcdc85e0f788	kid	545893cd-3940-470f-b806-3543449b48fb
f828ce54-1a26-45e8-a5c9-5610561f444c	37bd7453-ccb3-4f8a-839c-fcdc85e0f788	secret	jQII615rTWt3qc2XeGXn8w
934db91e-64f6-4c30-a0d2-ac2c221d2a0a	37bd7453-ccb3-4f8a-839c-fcdc85e0f788	priority	100
e0d35c93-0af6-4b8f-81ef-552bb5489beb	b7bbc700-ec8e-4e48-9836-ae5b9ff9003b	keyUse	ENC
94fa7b6d-3dfd-48b7-8d67-5da627948aea	b7bbc700-ec8e-4e48-9836-ae5b9ff9003b	priority	100
6cbf13a3-007f-472a-a2ec-2e260ac054c7	b7bbc700-ec8e-4e48-9836-ae5b9ff9003b	algorithm	RSA-OAEP
fb99d90c-c582-42a8-8ec0-1c5473a8c78a	b7bbc700-ec8e-4e48-9836-ae5b9ff9003b	certificate	MIIClTCCAX0CBgGMOPjoQzANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANkY3MwHhcNMjMxMjA1MDc1MzA1WhcNMzMxMjA1MDc1NDQ1WjAOMQwwCgYDVQQDDANkY3MwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDVFAY8MfpN2ubW1WkNeWv+vkYxKU16hvb1VLQgpjeIthAWsOjkm8KCvIujOkXYDGbV2iIaPKDCKBK/HjaaeD3FBiXWPXRKfI/NLniGpY33EcOAuBsBHdENeW7y1K4DBD+mVcFAbD+kYOEZH7IBo/dDExzKrgrHIlyTCKnatgJVq04eIRhHe892pOsPm6oop6NwYJTZpnunxlm/EGfV3rw08UCrnDnW7v0PwrF/dpHiv2q8Q+9BmRBaHxbRrI8VCezr+qDbJymuhUtdjm/f/7HDUaP5TvOaV1N/Dwt7nAyQn/ygwl/FycQS6NbkFsy/0TmUXMtmfrjSxkwJdJwQgiBVAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFdu9Bw0TsQAfjAlr20kwdJTqlQQWa6ph/Tw7hUj83pEMAsJAvgfUPAUkTnGcsVlIRiAr7p6KPe5PoOH2q0cm/rEZHecXvh+F3wifUPOAhtNfMLilOrEX0ANkiptay7a44noBaxI++ubDGiPkpZmmI5LyvHlS/6pqjXG8vO6b5c9cVYesMOuCVsVj2yuYyPxAmG1SZU8eLW7sqksdBL96n3YlVQjiP+V2WjAFfbgV2fu98OoEcrSvbZWRRuQdFg1iHhE1GHk4Jalxsp5xGQwoiN/LD19Yf6M+1h9AzJ8OEWriE836FjWTALmL0Fjwjp5bnHdKagXIGZu1UIA78L5I4E=
1689e040-e43f-4dbf-bb5f-15f07c61a834	b7bbc700-ec8e-4e48-9836-ae5b9ff9003b	privateKey	MIIEogIBAAKCAQEA1RQGPDH6Tdrm1tVpDXlr/r5GMSlNeob29VS0IKY3iLYQFrDo5JvCgryLozpF2Axm1doiGjygwigSvx42mng9xQYl1j10SnyPzS54hqWN9xHDgLgbAR3RDXlu8tSuAwQ/plXBQGw/pGDhGR+yAaP3QxMcyq4KxyJckwip2rYCVatOHiEYR3vPdqTrD5uqKKejcGCU2aZ7p8ZZvxBn1d68NPFAq5w51u79D8Kxf3aR4r9qvEPvQZkQWh8W0ayPFQns6/qg2ycproVLXY5v3/+xw1Gj+U7zmldTfw8Le5wMkJ/8oMJfxcnEEujW5BbMv9E5lFzLZn640sZMCXScEIIgVQIDAQABAoIBABGRDA6MZEFk6aEOiRGmUAP5ddn5uLyAQf3p1MvYSD3KHLtyLFEkkj2rA6waUsXEB/pbeHJHS02Wdi0xdXj4rsb+gcIO4PZ/HG/jA+a94V1cJo0HIJrP9Xsx5ra4V/xBrmmtKjiAdCK+JfCnT0qZVPo/qiD/hj3ylEU+8pnoZXrgdPrIIgTpAmjv68MMe/XJB214gAUSSBdEjPML7OnnPeFOXA8eEFcA3jHMhk2aJURHmtI0gWPjCM7KFTGQxbBMvkB6ToleHbhiNpOnyayA74ya/hvGPL97qxv2GfRMoI8TdUjKQAsxzjFzZAQxIIOSmYrmtNQ6UMOu1BDM3GY/8MUCgYEA+8u4zuY8uDdUimhY+mN9RmBRJtjw99zIa/Im3lqwsi78uLwlOYPz1TnTLBBTplWshGYXKQP/TJVVmuFufX0efBhCe7MwoDAjTZ/k2sjXYUZqWXCUAlqtwEDUpCsGpNVQMzshrxgIZxO2WVN7urAwLn/SXkiGWpHQUMj0DENLMAcCgYEA2KLOyAcIEPK6/87P4b6UfLCLHlP9nwLS5YcgN3j+McwjkCg4uIniytenl4cXCJ92uhd5aKT3Tzg2af9n8QoKTpt/tq3InuLhlx6iXWdkZCAbC3sdkKbi1LGjc5FHU/DBuJzBAw2pat4M2Qe3ChFgdRhqB8WlHrc+TAHF6w1mXcMCgYA0dosIGPK301d7CyjW6tnUSwc9l+AFVOwxiZ/NnonIZn/jodgDttmcKNM2ECTNuHYclATpV9rewxK2FZhm7yXl50wa6AgOqFkCuHj/mO8/ZmOMRSehofEn6Jolpo1Y1NVEB2MKT3CYwYOx8vIJwOIZHirf2C6eOll0K5ql33OQCwKBgBjkC/I7rJeV7Bp8PrJnXVQ+TJ29dMSSZHzu26rEAiDinatwk6PQY/h+cskcQm9BMzkKfW6ila/Ke6YOLHkreCe0AiaRLR3kX5snb+xfds9ySOk2yhzWr/VUO72JkbJ5VSjLCfo51Z9rx/ofws4rVPPfTD98XA59a3D8OytYrMxVAoGAVf/tq1N6xX/qGvjWWktdO/URBnljC8DXLHQaKR61W+jIOx9fBhWlNY9u4AXv5zETHLCKPDA0FzPzWGJuToljX1SSx9mihOE9Mk7gjp/AUnOfX6G9beI3jok/IGbDgtTPtxrjt3NC4E70/+y2WiHRPibllRss90FwBLpzgy5LKtY=
caaf1617-1e43-4ab3-b7c5-c770d1ca866e	bb5ded0d-cbdf-4c1c-ae65-b481ecc5f9d0	kid	41e1aab8-5bff-4a36-977c-cf01f24d7107
8b4d4206-adae-48f2-81f2-caf49869a823	bb5ded0d-cbdf-4c1c-ae65-b481ecc5f9d0	algorithm	HS256
005c82eb-2a08-4b9b-abcd-4c9eb32f13f2	bb5ded0d-cbdf-4c1c-ae65-b481ecc5f9d0	secret	hxJWBleAP9tUcBXf2uC_cJeO2uQiI4kkupxvYNtQ1A5IWphBLAm7v8JOQrOXJ3BiERkqRyu-kg85uGiMBZzRdQ
fdd7d63c-e6d5-437c-b453-0443b8e6c5c6	bb5ded0d-cbdf-4c1c-ae65-b481ecc5f9d0	priority	100
66f052cb-6b2f-4ba5-9c06-a297127e646d	dc4d28bd-8f56-4e85-b537-ed6fc13db399	allow-default-scopes	true
9f8b01ae-aa49-42ff-ad72-8c954886ae5e	34918069-efa1-448d-abda-11f889f1ce55	client-uris-must-match	true
f9d685b6-e5e0-4fed-b037-dc0763152b6c	34918069-efa1-448d-abda-11f889f1ce55	host-sending-registration-request-must-match	true
e70537ef-ce35-44e1-a484-771476aab689	93c20b36-f4c1-4494-88fd-8fa17c97250d	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
1a31e5c6-94c0-4437-9a34-6b4b9141a3db	93c20b36-f4c1-4494-88fd-8fa17c97250d	allowed-protocol-mapper-types	oidc-address-mapper
f6020fc4-d25e-48f5-a588-67a202bf2218	93c20b36-f4c1-4494-88fd-8fa17c97250d	allowed-protocol-mapper-types	oidc-full-name-mapper
1870728f-b86c-4739-9dd0-8855ffef50f1	93c20b36-f4c1-4494-88fd-8fa17c97250d	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
197d30a5-9993-47c7-b782-25d5d67def8f	ece73da8-3447-4175-ab23-da7f8f236cdb	privateKey	MIIEowIBAAKCAQEAsZ8gH5Xr31Kg56Qpv9vNAhwEWt6F80bhn7jywwWgRXjRVUg8wYFzlyLItIJXs5ZTJ3Sy5d8Egn7zM1Tf29867lTvEhNOTLVKixZcOOAkF36eqf+fZVOO5LXsYYcvoxc9N2FSI5NYFndPcjVbbijAcI+dx2BqyGTVOYFz6pPflXczYMWhCQ76CWONc6BiCW4fhAXX72MRME3Dko7i2BWxetq2ZqWvYafcm5op0KhdOrl+prknnuLJJG5Bb8DHPkA2I200NlbhZhjmAAd8L8O8GC259iLQDj6bafJudMWJea4yLazT/LVmafQPhMbv1YiU5nsyDq05Chrk9zXU0sNktQIDAQABAoIBAAwCVTqteUAlJwniWIxHQSomWMkICIh1P2X8LDWxWK+5xnV8p9bxeK48RNOniGR1AnRFeJ8AIB7ulGThFS2ZfzOD/JH9Sir3iu2yelPCG86W2gVmahGAv8WI402IxVjChnoLE3GiUa9bK7zuDJt7F9/EZgeH5lBcOOplbT/r9Y72XmU5NDaPtljedY3wHmVATlgly1XFKhVt93/dkf6QPYd1Wc7UDdwr94qd0urNpjNQjuFEm+5d9QbDuM6JUQyMfTwxHyu0ur5y7sST57JEDB27b328pU7+7gDxLjBDhrDh+v2V5eb5WzN0tg9Z0MHBlNOaTDQ0Cw20IH5rDGj+HnUCgYEA2KigwBhbEZzV/kWdXf7UYEsf7fPC82JGFS97LMSmb07vInrGOwMCj61OwF4r0f6VUNZzFtgPt8x8Upt+ZZTDjPto6CgswnCzwCjaUAuzdOZZEvZ67/VdbXyoBpq0Qpi7FHad3WH1aW+tOZdlxMcrAc/iqjMLj5RIxLOCpkDNl8cCgYEA0d/bxLOyaTpqaGPRqCh8xHQb9ppclg68HavA7Zb5ZIHWlxaxIyAV64vw2RbwRDtYr1rKEcKdBo5Ek1tUX5cGlOVS9yLpVFUH8dBR9YiqDW7ATX7eLlhNcwhvJJOKfa7vipZ6278iFGMkmmppTua2ZgNoTMh+Z43JcssI7fnAN6MCgYBwfxaAx+S5f3MJxUHR5ZiGq1tX5aNLVrLHG1FczHsS/qxifddiGs0Ap19luUANmKAVSlSV/vgiWnYPOpflzNnA4WX2ba3YBEcBNvUsbPbwcw67LupkoEWzrO9eBoQktEMne/O6WLvh1E/gwIDiLPxiw3uRHlIZakhigkcLZkiaTwKBgDnuWtFe8L5PG5QZCYQrONVZX2agkTHye0aNZEGwzMJLfJpT7y1M7AAKrr6dsFCFOSOeIezpFUL7/j3WleGU5IIxEseY4WMf3YOIBzeJM7dlfLtna5jLUwWPrG4iM7YhlYlhpCQIDDYob7AX812OHYbnJeEb7phS8Oo41QwrRj2VAoGBAKqHTLjsB1S2q+cD2hHK0tY8jt2woHDAquigoKXWmqCbILHFuZrW44Q8/6vidN37j7kLljePVRz07e8ihm8wYcMBF9jpgMI6Y3kGOAiEmhyZRd74KdB96p2TiI3f8Vp3BScA1qp74G9LuC9RpgiXgA3XPbBNH3spPB+gACD+LKKX
892835e2-9b4d-4f1a-be37-c3e67ece4d52	ece73da8-3447-4175-ab23-da7f8f236cdb	priority	100
017d5481-af03-4d24-8e9a-671c78a13d91	ece73da8-3447-4175-ab23-da7f8f236cdb	certificate	MIICmTCCAYECBgGMO2E5ATANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAVhenVyZTAeFw0yMzEyMDUxOTA2MTZaFw0zMzEyMDUxOTA3NTZaMBAxDjAMBgNVBAMMBWF6dXJlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsZ8gH5Xr31Kg56Qpv9vNAhwEWt6F80bhn7jywwWgRXjRVUg8wYFzlyLItIJXs5ZTJ3Sy5d8Egn7zM1Tf29867lTvEhNOTLVKixZcOOAkF36eqf+fZVOO5LXsYYcvoxc9N2FSI5NYFndPcjVbbijAcI+dx2BqyGTVOYFz6pPflXczYMWhCQ76CWONc6BiCW4fhAXX72MRME3Dko7i2BWxetq2ZqWvYafcm5op0KhdOrl+prknnuLJJG5Bb8DHPkA2I200NlbhZhjmAAd8L8O8GC259iLQDj6bafJudMWJea4yLazT/LVmafQPhMbv1YiU5nsyDq05Chrk9zXU0sNktQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQASZjLYI+rm13wWpzqQdYlT8OyjG+KiWGg2mXDu1BF2lfMK7mC+L/OuSBdL+rdutO5PJUhqlMev6NvZre9ZOgrX3KrRccxLTe2I5E/YZfFkzYYvhevIv5RvJ3Axu+gEQWQzVhg6udOix3M6B/dXs1nlZM+FmEN1yuWiX3kmVrJQDac6JG6wtdSp/I4XgvhtKZudwUkDpe4kOBvrQFBP2QYoqpUjC129rOQw2A99sduDXdhgKaarMZ64INnbj8PIJXEDMU6GJwMsVV8x2gbH7hvWuUR/oPKs8vPdWTWoGUEOlUJjIzGea4GSYBy6SWp2ZRPWtzHG7mZ/b1n3U63r5m+o
a0065133-975d-49e1-b311-396d8b5df9d6	ece73da8-3447-4175-ab23-da7f8f236cdb	keyUse	SIG
86738e95-50b4-4bc1-8a9f-4a65ee7c93ac	cafa2a6f-7f54-4dd3-81a1-319cd239b514	privateKey	MIIEpQIBAAKCAQEAozGZdChn468QNbsf291aUlHBnTvOBMKllJKSkisVwf9V2/o3YOAhuB1P8J7HZ9hBvkXnLXW6VF0SZkbu1EGDVbhSvEuBgNWjNxkosEd4VkSPqO2VhXwOHDbbcK5+3nSfvAPSAfZPm2JkSUytFhHG3zXQE1WtG1PGU2jfzFWob46ldVMuPIy8FgyPSKPy9Zn4sTxrUAyKgXfbdTCKa+2iD3aKgZjNNGO/qj9rzvVyXiWlLUaRHTI870+qkNPmwcRrPZGNarYltfCp4jMpWDi/Ak1DS7qNXS6xRocFVJpt1VbdwS5y1wMYw2WQ9Vx+3CXVMH619wa2V+PPew8VI5FnRwIDAQABAoIBAADqDMpKDxyqUObfnEQuBpl+j7jJuY2SaVtCzj+afDB3FQ1fFn2NSs0beQLOG5VVBKX6JPvw+rpunpTjC8ln4xAuIcP6mh2zdpTqTah22VUrpefNNyOaDO0+yxQMAEFJ4+VR0LVmEPrP+Lak4j8zYrnvj2FQbZ88Ga4fyiZcEKX/LokUwVytErCfA5cchNDe4EXfqIEfyHX+kELISppR5E/M3bQvmDDJjXTiUNWQJbNuvYMaj7S634kmxvT4lhXvHB1lcqz1/kRhh5KK+UyFeI4DZ68NajJjRrkdJa+xnQuQi1qDzx+v8YXacWWiJFHPuhpjRN/7wEUNOZdNMsQceFkCgYEA5p6TfLUEO1AJ+vHBHN8B6fs1JwnDXLh0mG5r7dcrWl/bZe2HpzfpI2SQm+qCaIYMM8YorjiPF+spJfn+xb12cn/NVquFwjww9ROddEHlwavkpGJ9MkRTmNeNtL6edTTH58sFdz+L6eFIhZIS58GQMHznc3k0IhnWXqGOzYFum0UCgYEAtSdi0HtZbDg5QUd79Crn7B5ncTpecLnY/TXuwJNt/e//iYG0AFQL8mK+R5bgS5U2FRr/N4kjzNTD8FGlEyyDVrVgTn8RX3R6Bwgr3PMyx/DJ5misAPYdWj/zvUo56FtdotoTHTgrPdFOvmsdWsNF2O3N/scoaQ4Fay2M5H132xsCgYEAqrTQ2WuogTsC2DUhS/yrDwZ61rW8XaLP85Ew5PHzzkbMQUussROKyD8FZ9QTyckHuT9CF4wYJ41TfR/q/XX7+k8tsKzwKtGhL5fgYhDxQAW8Dg41PAMlmipcY2ECLCHwo1w9ZIKuT2YJ540z30cBM1MRhAFAnMlhS9TsvqPDOr0CgYEAoV+logzP2xy2vFU+sYLrOSbYhUA20vprtx0tQ3XR/O2n2MmnHMfCILkfwkxAIHSaSfDTu5g6QQSkS1ef0tXLZhmK4kJFqp/q+Iqp8FjhOsVgRhWma/DSswvXSB9wOHHzltfnQRdBRf9Hw09ORgVAGn+1CqpFcFhiMVjRctXmSFMCgYEAwszIVlE6rs4y6vo3Y2L820KvIXyj/wS+8YYb/iiaYcXPvpO9t1RHWeeoCNIo/sIRRJSfs1PD3793BK99XusQNaxlXHnEwR6AHZJjZJ2Bb3tjG346u1/JPrB64viuccXMzySJkfCjl7oxV8EzIBsdci+NoLS03ZGSKYttcqVQqts=
1ee739ce-fac8-4ca5-a3c8-bb0c47de493a	cafa2a6f-7f54-4dd3-81a1-319cd239b514	priority	100
128f6327-9209-423e-968f-55e8f3d17d7d	cafa2a6f-7f54-4dd3-81a1-319cd239b514	keyUse	ENC
c86d5018-ed92-4f68-b2d9-fe183991d32c	cafa2a6f-7f54-4dd3-81a1-319cd239b514	certificate	MIICmTCCAYECBgGMO2E50DANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAVhenVyZTAeFw0yMzEyMDUxOTA2MTZaFw0zMzEyMDUxOTA3NTZaMBAxDjAMBgNVBAMMBWF6dXJlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAozGZdChn468QNbsf291aUlHBnTvOBMKllJKSkisVwf9V2/o3YOAhuB1P8J7HZ9hBvkXnLXW6VF0SZkbu1EGDVbhSvEuBgNWjNxkosEd4VkSPqO2VhXwOHDbbcK5+3nSfvAPSAfZPm2JkSUytFhHG3zXQE1WtG1PGU2jfzFWob46ldVMuPIy8FgyPSKPy9Zn4sTxrUAyKgXfbdTCKa+2iD3aKgZjNNGO/qj9rzvVyXiWlLUaRHTI870+qkNPmwcRrPZGNarYltfCp4jMpWDi/Ak1DS7qNXS6xRocFVJpt1VbdwS5y1wMYw2WQ9Vx+3CXVMH619wa2V+PPew8VI5FnRwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAaOLhjHkb0NUDl0aInZwT07KGI4JRBLMv9m0QTLwZ5nkBJZAjERnArD+q+iSmRRIswN0MR0wDzEiOTv4+F6F909vRKeTeNPlNGa+ALArZsM0wOq/42QxurRvnpUCa6o6/0GWpZqyZO4gy9T63Ue3WHWZVuVKWJ80o+c7mo8bP2yWlUS6MB+dI5M8i6U6i1rSJJeSA+ZUwB6zLfAMo2+Xh5NquUbWhQq2bWjhY7Uo21CALATtkQxPO44Ew4FV+4bMlliJAxvbS3PLENtv8DnkngL5erGkpFxE7aNqWU7tyYv5zTPpo7y0vZOvpOYS3lJ+a9UPF742mQ75xsXhiJv7te
8bb7fea0-635d-45f8-843b-13afbc7f7da5	cafa2a6f-7f54-4dd3-81a1-319cd239b514	algorithm	RSA-OAEP
56d23a4b-2148-4d06-9852-f38877fd6c1a	12c90455-58f2-429e-b40b-8766801d3f77	kid	de5e7621-3557-423c-92ff-1a8ec2d86693
52a06280-a85a-45c3-b210-4f4716c12a94	12c90455-58f2-429e-b40b-8766801d3f77	algorithm	HS256
bcc7972e-757b-4684-844f-5b62b15629c1	12c90455-58f2-429e-b40b-8766801d3f77	priority	100
122fe248-f359-46c5-aa15-77b01a7ff589	12c90455-58f2-429e-b40b-8766801d3f77	secret	_7qhzIEYbC4o6Ij4m6kV9mN4gHFzeUAZ0rCKGC9t78pSCM4Tu8UgqBr00sLfrwv45cRlKv3B5PIBYfpencEKjQ
b439a225-fdf4-4648-b4e7-b74602ea797a	a26378de-6524-4363-b07c-de1a6b55241c	allow-default-scopes	true
6468aa8c-8689-4f8c-8e95-66f619eb6139	0517ffee-1a61-454d-97de-6f6cc70afcea	allowed-protocol-mapper-types	oidc-full-name-mapper
104cde6d-fdfd-44b8-b86d-e2cccd9673b3	0517ffee-1a61-454d-97de-6f6cc70afcea	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
d4a7e82d-3345-49ea-8d04-59d374a7bede	0517ffee-1a61-454d-97de-6f6cc70afcea	allowed-protocol-mapper-types	oidc-address-mapper
43422e78-9e79-438a-b089-e53707077d93	0517ffee-1a61-454d-97de-6f6cc70afcea	allowed-protocol-mapper-types	saml-role-list-mapper
280280c5-90bc-4cae-a25c-7d880c2c0050	0517ffee-1a61-454d-97de-6f6cc70afcea	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
47719682-3d8f-4e6f-90ac-59fd9517c1a6	0517ffee-1a61-454d-97de-6f6cc70afcea	allowed-protocol-mapper-types	saml-user-attribute-mapper
f9a7f2f9-c69d-4d71-9591-d0005b90f36c	0517ffee-1a61-454d-97de-6f6cc70afcea	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
910bf8fd-145c-44f7-9863-e04e6767fd58	0517ffee-1a61-454d-97de-6f6cc70afcea	allowed-protocol-mapper-types	saml-user-property-mapper
1fd64492-ee27-46b8-bd9e-06256577c39f	f269850c-801d-4a2b-8273-36e6c7c98fd9	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
40d80413-0777-42b6-82bf-850cb424c8da	f269850c-801d-4a2b-8273-36e6c7c98fd9	allowed-protocol-mapper-types	saml-role-list-mapper
f1178f6a-603c-4c0e-b7c9-4c8a6139f316	f269850c-801d-4a2b-8273-36e6c7c98fd9	allowed-protocol-mapper-types	oidc-address-mapper
e561e2ff-602b-4511-8834-c936f1107eae	e0a08aa2-78cc-4d57-a13b-bdbaa3fee425	allow-default-scopes	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	b5c78e84-1a6b-450b-b278-85a2312c975c
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	76d177e2-21d6-4e23-8dd5-4285e2528d85
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	5b15458b-c40b-4cfd-9d9b-db14d3fff575
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	2fece0a1-2a5c-4a47-a1ad-a036d6352af5
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	433641df-1120-422c-86e9-60b6bff4597f
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	3e324bc9-f1d9-4d63-970c-c2fbaac02817
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	31a283d2-03b1-48b1-9afd-62878dd92683
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	1ec2649a-2744-4919-8877-bc677af4905b
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	adce5f0b-9e39-4f79-bb45-27c286b23fc7
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	4c35a08e-2664-429e-8902-6f877a5ed5c3
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	99848c6c-4a60-4ac1-af43-3956a3991c65
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	748ae45b-f047-4377-b285-dce53551b2f7
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	b8c29d27-4dcf-465b-b2ec-4cf5b841cbad
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	c5f52507-71ba-4a4f-81ea-e15335a5b78b
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	ceab24b2-08ad-4fd2-ba79-251902970d33
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	8757ac14-5266-4859-a59d-1101e11f3f15
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	6499e4b9-4793-46ae-950e-54b888b4471b
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	9a74f32a-d8b9-4d5a-ad95-83990c07a1e4
2fece0a1-2a5c-4a47-a1ad-a036d6352af5	ceab24b2-08ad-4fd2-ba79-251902970d33
2fece0a1-2a5c-4a47-a1ad-a036d6352af5	9a74f32a-d8b9-4d5a-ad95-83990c07a1e4
433641df-1120-422c-86e9-60b6bff4597f	8757ac14-5266-4859-a59d-1101e11f3f15
f245c712-a381-4ac4-bb2e-193e9a3ec9a6	f2e831cb-e2fc-4433-b7cc-c0e663cededd
f245c712-a381-4ac4-bb2e-193e9a3ec9a6	2ff7c508-8ef1-4fac-9136-eada415094a9
2ff7c508-8ef1-4fac-9136-eada415094a9	2391d0ba-f3a1-446d-8a32-bf828e133f26
e7d71dd1-3585-43bd-9491-2c4b5bdd4640	a9ee7d22-cfe9-41c6-a263-87e470eb50d2
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	d60c5824-7589-40dc-b9d6-d4bc80a9b782
f245c712-a381-4ac4-bb2e-193e9a3ec9a6	48a32976-c284-4195-b294-368b5c711cb2
f245c712-a381-4ac4-bb2e-193e9a3ec9a6	a2c26b9b-0f03-45c5-b87a-7c61b95f734c
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	92e6eb9f-2ba4-433d-9a23-e080195a8195
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	0a631c11-8629-40c0-905c-745199883a13
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	05d66c65-8028-438c-90f7-fc172be4f9b8
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	6a6f5fde-a01c-46e9-b28b-2ee8264fdcb2
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	dee95d4c-f1d0-4725-92c1-2d3c9546bb72
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	de6dec9c-4563-4153-8b63-5d1e89b5df3b
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	7c6cdabc-4996-4b62-909b-ef4baae19a4d
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	11f6016e-c74c-4e05-9471-ef20800e5dbc
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	40f01fe2-8049-4e44-a2ab-d47b6e2e9b58
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	b912be96-99a6-424e-b6a8-3e8fec7709fb
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	ea1b8a08-fb79-419a-8bc6-4a2f83bda4b2
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	497d2e6f-188a-45bd-80d1-7a218453cde5
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	8d526b7c-c61f-4441-9019-18397563a6ed
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	b6b00af4-27d2-4b27-8d2d-c88ba6b88d45
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	f3ce16f3-ada5-4553-bdb3-881434f74012
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	8ac9e5b5-db2c-4215-a495-c1af7f8a2bbf
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	996a0a22-d936-4031-b861-dd5c21dfda2e
05d66c65-8028-438c-90f7-fc172be4f9b8	b6b00af4-27d2-4b27-8d2d-c88ba6b88d45
05d66c65-8028-438c-90f7-fc172be4f9b8	996a0a22-d936-4031-b861-dd5c21dfda2e
6a6f5fde-a01c-46e9-b28b-2ee8264fdcb2	f3ce16f3-ada5-4553-bdb3-881434f74012
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	26c048e0-d9fe-471f-a4b6-210ec1da02cc
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	e94bfca1-ac20-4d74-ab5c-6ec647cf671e
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	7377fcb6-7221-4ca3-a459-36f02ba5edc9
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	baf8b571-25a8-4ecd-bdd1-08d836e7da62
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	1d7e839f-fa15-489e-b3ea-2953fce4e34c
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	57b752ff-3564-49ff-9eb6-7269176bbbac
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	9f1c393d-f840-48a1-bb47-9909a3a78edb
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	5524d04c-798a-4247-be0b-21bd080e210b
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	a26d1e66-fedb-4bdd-b79b-fd7f9415f672
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	c9a8322c-3f7e-4eb6-ad25-2c880d34f240
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	176bf30d-ee43-4d73-aa01-43d59e466b43
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	92f17868-9ca5-4c43-b91d-dd3543c6b586
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	c2824b22-e600-49ca-a6cc-21647cb39bc4
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	ea16b16a-930f-40a8-9c92-0ac5c020f6ec
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	43966c0c-1f1a-4048-9123-662ba43a0c05
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	9d6e9db0-04a0-466b-ba8f-9296bdcc07cc
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	4e72d253-af63-4428-b857-cd0254bda9e3
7377fcb6-7221-4ca3-a459-36f02ba5edc9	ea16b16a-930f-40a8-9c92-0ac5c020f6ec
7377fcb6-7221-4ca3-a459-36f02ba5edc9	4e72d253-af63-4428-b857-cd0254bda9e3
87f1ba85-55c3-4fd0-aded-2235a0979bcf	98c37d12-5f6d-4633-8a89-68a03e518dc8
baf8b571-25a8-4ecd-bdd1-08d836e7da62	43966c0c-1f1a-4048-9123-662ba43a0c05
87f1ba85-55c3-4fd0-aded-2235a0979bcf	22001e30-8364-49d3-a29d-2ec575b3ae24
22001e30-8364-49d3-a29d-2ec575b3ae24	f8ddf4f9-0548-4cab-8006-7bea086140c5
bd4e05c5-7f04-4a4e-89aa-3a0f670212a3	ce3233e3-c8ff-4c0c-b985-9b8cbe0fb271
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	771d9c50-2fea-422a-bca8-9de5ba209ace
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	fd988319-a2ac-477d-826d-b4bcb74db223
87f1ba85-55c3-4fd0-aded-2235a0979bcf	d6613e2d-56a6-41e7-9cca-cc08b6535a89
87f1ba85-55c3-4fd0-aded-2235a0979bcf	ce9b5938-d7e4-492c-a074-a27204bd3554
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	1e48f0ed-175a-47e1-9fad-364778cf9c30
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	4030b3c4-1d98-4372-8db4-78675a297124
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	18e9738c-3f42-45a3-adbb-6a29ac761bad
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	a55de2ff-a941-430e-9168-daa93dcfc864
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	b637c4a6-6f69-4d77-aaab-4941df2ca04d
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	80e88b8f-0b3c-4e57-85e6-514b01f93b26
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	29c6f6da-ced3-4c7f-a19c-81e76a0f984a
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	8823f58f-5fbf-412e-bd11-c94e0467c095
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	7239a397-b856-45c3-8426-c1d5ca194332
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	bf63ee79-228b-4cd8-a5f6-ac481d701672
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	a29987b3-aca3-4744-b413-2a7c3c5e8a3b
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	15c925a0-154d-4bc4-9c9a-2378813bfc12
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	c1800c56-4d88-4a03-9b85-ee9807728978
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	f2fa273d-dd77-470e-8b30-b209783c4d69
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	391621a5-370f-49ad-b185-13f59a618a0e
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	941f09c9-2d9a-4271-afaf-e77cfd389829
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	9c657277-4b98-4c74-8aa3-b887e3a4319e
18e9738c-3f42-45a3-adbb-6a29ac761bad	9c657277-4b98-4c74-8aa3-b887e3a4319e
18e9738c-3f42-45a3-adbb-6a29ac761bad	f2fa273d-dd77-470e-8b30-b209783c4d69
a55de2ff-a941-430e-9168-daa93dcfc864	391621a5-370f-49ad-b185-13f59a618a0e
c1997c7f-fabb-48bb-9d62-f5645cd22983	43171c12-49e5-4fec-a0ba-2153abfdd4bc
c1997c7f-fabb-48bb-9d62-f5645cd22983	787c68bb-2c83-4e9d-b46a-a0734c9859eb
c1997c7f-fabb-48bb-9d62-f5645cd22983	f5ab553a-c781-4d91-922f-f8ef945bfe49
c1997c7f-fabb-48bb-9d62-f5645cd22983	3a4f45a3-a783-4a0f-9db3-b54731ae87a4
c1997c7f-fabb-48bb-9d62-f5645cd22983	5bd6ef36-31fd-4b33-949f-986662ba64fc
c1997c7f-fabb-48bb-9d62-f5645cd22983	bf05d72a-a197-4ed2-89f1-b149836fdcfb
c1997c7f-fabb-48bb-9d62-f5645cd22983	5a37fcd8-0360-4ded-8161-6f148c3585ab
c1997c7f-fabb-48bb-9d62-f5645cd22983	d902b136-e674-4b31-859a-65924e376222
c1997c7f-fabb-48bb-9d62-f5645cd22983	ce7e2e03-7cfb-4bbf-b661-73c1aef628fa
c1997c7f-fabb-48bb-9d62-f5645cd22983	9d85fa15-b145-4d71-adc0-64479cf03c3f
c1997c7f-fabb-48bb-9d62-f5645cd22983	e5e6cfa3-10e5-4769-a8ea-265c6ca39be4
c1997c7f-fabb-48bb-9d62-f5645cd22983	f755f875-c132-4964-9703-3028ecef82fb
c1997c7f-fabb-48bb-9d62-f5645cd22983	60c55f4f-4618-494e-820e-81b86c2ff1be
c1997c7f-fabb-48bb-9d62-f5645cd22983	b47b149e-b902-426f-aebc-92aed2f3061e
c1997c7f-fabb-48bb-9d62-f5645cd22983	bf83288b-2a9f-4841-8588-cb89c195f768
c1997c7f-fabb-48bb-9d62-f5645cd22983	862dc701-d8b3-4f0f-80a1-001a6a595867
c1997c7f-fabb-48bb-9d62-f5645cd22983	fecbb392-d514-4b80-816d-be6185a26309
3a4f45a3-a783-4a0f-9db3-b54731ae87a4	bf83288b-2a9f-4841-8588-cb89c195f768
65b905f9-d2a1-4a88-b361-780f85c5c0a7	b460d6f3-aa20-4cd3-be73-78cb894dbdaf
f5ab553a-c781-4d91-922f-f8ef945bfe49	fecbb392-d514-4b80-816d-be6185a26309
f5ab553a-c781-4d91-922f-f8ef945bfe49	b47b149e-b902-426f-aebc-92aed2f3061e
65b905f9-d2a1-4a88-b361-780f85c5c0a7	ff242237-9887-404e-98e4-d57f4a568a00
ff242237-9887-404e-98e4-d57f4a568a00	190c4209-d0d8-4c2f-82c7-70915493861e
1f9c0276-fe0c-4bc7-a078-fb49c5a443b9	8d4a096f-f630-4ec7-8181-519c282080ae
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	0befafa1-e682-4800-84b8-0cced3f13577
c1997c7f-fabb-48bb-9d62-f5645cd22983	fb4d1686-8a7c-49fe-9018-de51515d9b93
65b905f9-d2a1-4a88-b361-780f85c5c0a7	d70bb390-df88-4695-ae78-0c536c755765
65b905f9-d2a1-4a88-b361-780f85c5c0a7	8c985109-1655-42fc-859e-eb026d2af38d
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	25eb64b0-b39f-4120-9b22-5c7cc540089e
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	ea001888-d70c-4fce-bd92-5ec7c2121a8b
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	623f19b9-2836-4d8d-9542-1fd94f126e3f
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	44d2cec3-d190-4e7f-84c6-51b10130c55a
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	922640ca-9072-4285-b098-5e78e6742799
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	530481e3-5049-4df4-bcdb-0b6c7ff2c8c3
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	2b54e736-7516-47bf-9471-a40b1c0aad07
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	0e046bc4-e42e-4514-9d94-70096b0ac90f
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	4c05170e-2511-4a2f-b764-252d02003921
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	76f38b87-ac07-4453-be87-2aa0c52f3014
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	31654f2f-ffbc-48b2-ade1-acf5aa3c9d08
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	74b8cd49-dd54-4d5a-9ca7-c5629c7d79cc
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	17f5dd03-cbe6-4d13-b35f-2a387cb8a326
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	fad71b2d-abe4-47cd-a0f5-bcb58ec1e717
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	cd862773-9af1-4158-bdcf-82f75874ca60
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	19f59c90-3b21-4028-aefa-e85aed04d6a7
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	7c9c6b67-2b97-4af7-a916-eea1e6e84981
44d2cec3-d190-4e7f-84c6-51b10130c55a	cd862773-9af1-4158-bdcf-82f75874ca60
623f19b9-2836-4d8d-9542-1fd94f126e3f	7c9c6b67-2b97-4af7-a916-eea1e6e84981
623f19b9-2836-4d8d-9542-1fd94f126e3f	fad71b2d-abe4-47cd-a0f5-bcb58ec1e717
20482c62-3dd6-444d-8439-0d2625fffb2a	a7033cdc-8149-48b7-a161-67cbf4f7c106
20482c62-3dd6-444d-8439-0d2625fffb2a	bc2e5ffd-8311-49a4-a12c-25d53578207f
20482c62-3dd6-444d-8439-0d2625fffb2a	6c1f04f5-9eee-4f0f-81a3-e6cccde85c8e
20482c62-3dd6-444d-8439-0d2625fffb2a	3b50bbef-f5b9-4d20-bf0d-12fb8b8a9fee
20482c62-3dd6-444d-8439-0d2625fffb2a	005dca18-3c57-48a5-9f64-d573a4889cd0
20482c62-3dd6-444d-8439-0d2625fffb2a	1c433cb7-ce51-471f-8fb5-3ed5157b32df
20482c62-3dd6-444d-8439-0d2625fffb2a	2f13248e-4223-4e49-9f0a-63966ecef0bf
20482c62-3dd6-444d-8439-0d2625fffb2a	be34b051-6b93-4cc6-8a59-aa2265659569
20482c62-3dd6-444d-8439-0d2625fffb2a	14de4807-6832-4a67-a306-fe1cbb2cea08
20482c62-3dd6-444d-8439-0d2625fffb2a	c5d5e569-5d43-4c60-978c-d4af75362682
20482c62-3dd6-444d-8439-0d2625fffb2a	65ff09f9-071f-4722-a7a2-667d0affed10
20482c62-3dd6-444d-8439-0d2625fffb2a	dbb5466f-037e-4455-b37f-caccf038ef82
20482c62-3dd6-444d-8439-0d2625fffb2a	d1cf435c-dcad-4046-90a9-7a0a4afd4e10
20482c62-3dd6-444d-8439-0d2625fffb2a	4e9c27e8-07f7-4460-bb71-5a2c0f2ea123
20482c62-3dd6-444d-8439-0d2625fffb2a	952475fc-aa48-413e-96de-4377b541b943
20482c62-3dd6-444d-8439-0d2625fffb2a	d579ed1a-3f09-40ee-ae1d-a6192e381f54
20482c62-3dd6-444d-8439-0d2625fffb2a	ddf98d12-2274-4296-b2d7-7eab6fb30d42
3b50bbef-f5b9-4d20-bf0d-12fb8b8a9fee	952475fc-aa48-413e-96de-4377b541b943
6c1f04f5-9eee-4f0f-81a3-e6cccde85c8e	4e9c27e8-07f7-4460-bb71-5a2c0f2ea123
6c1f04f5-9eee-4f0f-81a3-e6cccde85c8e	ddf98d12-2274-4296-b2d7-7eab6fb30d42
dcd95271-392e-4636-aa12-4aa46e20ef5e	36d646d2-8807-4153-85cd-4879156363be
dcd95271-392e-4636-aa12-4aa46e20ef5e	2010040e-4eb5-418d-a8f9-a15b68d029e6
2010040e-4eb5-418d-a8f9-a15b68d029e6	94a133ca-161c-4603-aa98-d62a7428b5e0
14d077cf-5506-4d41-8d67-d0f50e0e6816	1d01e7e7-a063-4607-8e57-4f0ec6e114fb
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	04e89edf-ec67-4d71-be38-97e1510ad940
20482c62-3dd6-444d-8439-0d2625fffb2a	1d729b70-9c1a-474b-9e60-589dbcd9b475
dcd95271-392e-4636-aa12-4aa46e20ef5e	5dcb867b-0e23-4df8-977a-2027505e10c2
dcd95271-392e-4636-aa12-4aa46e20ef5e	f362c50a-09da-4a90-9a5e-064b2f84192f
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
2658a72e-cf39-4ef8-8357-1405b9068edd	\N	password	87c2b594-815a-4caf-bb29-53391f08e2ee	1700148723657	\N	{"value":"ow0t02kch221IJ4MjxNuvzDmqup2/uybxUb9wduoZoY=","salt":"TByjBer3wAk8sl4gm5Es4A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
a0cfb5a9-701d-4318-8843-bfe3b3b50f2d	\N	password	c2cbdc41-9f23-4346-a369-2afd70304956	1700149077269	My password	{"value":"ckFUXXTXjcjvSwCbGfI64WTUpU3BiwzbOFuk0pdFiYA=","salt":"k/XJKYG8bdFMflqZ6eda+Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
94d35a56-60b7-47e1-ab19-b78e7333fba8	\N	password	36cd9333-02ab-47eb-b4b1-28bbe5ec8612	1700167040427	My password	{"value":"KqW7zwCUvwZy1GdulEmD1pJHswaMrE0v1uDq0NDVZEw=","salt":"8RmNohxLa7C2W166k8x5rA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f22a419e-5948-4084-ae24-02616238b90d	\N	password	43ae0e3b-7217-430f-b15a-71042d03da05	1701691993980	My password	{"value":"Y25/boKwxqVKrFCqoic/O8NKAogBCyBPL7PskVT265k=","salt":"898GWO/h1s1kpkDOmMUeuQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
51aaa1ac-de27-4425-86e0-e8f59fcb7630	\N	password	2f950c85-d521-482c-9df8-e458c1719b45	1701765478895	My password	{"value":"L2Bv+YSudoFFWuw4BHwWshCmlg3s3i76CjRPmlMxDjE=","salt":"U7ECWGd9mvXOrbbkyrapUQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
61acf69a-45ee-4f1a-8cd0-df23d8ff200b	\N	password	6a94d423-1726-49c1-85c7-7ebb07c54cd5	1701804903239	My password	{"value":"oY197RJYCJa4xcMFEMYlbZWm1D8alWxIQTgsSH7JfIY=","salt":"Lafq0pN4ArDu2Hq3K23FOw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
1efb9094-c0f2-4911-b570-c4123e95726a	\N	password	b218fc6e-5a33-4efa-9d42-bd3834a27bc6	1717066429610	My password	{"value":"E3L3tFQjOemAqGDmoI2xnJzolwUNfuVwylMjMyM2Sf4=","salt":"6b8lDBEHXCZ/l81AeU6nJQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
d6863637-9bf9-4edd-bfcf-328bad6a7dd5	\N	password	9b8f8a53-3cda-457f-958d-b2b475160167	1718803688494	My password	{"value":"lA+C/RAC92IeMsKCjvtCghCxprLxMwgODaN3PFJ0jjs=","salt":"XVpILKtHSGYPM12NhPlrbA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
96bc0ec0-b9af-48fe-b810-f4378da5a005	\N	password	ba0e7fc2-5b25-4f9c-8f5e-958fd53a831b	1719918715552	My password	{"value":"bZdvrBsO5J7n2lbbmzFupVBwEPoXQbNBwdvAHJ1Cij4=","salt":"Z9HZMSnErrvRD/m01bZRCA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
5c097150-afc2-4ce4-8855-a67e83e8c147	\N	password	a7f60154-c27c-4a87-829e-54ba175192bf	1719918749390	My password	{"value":"3EaYeaXxTuDdD1FhPbHBTlkzh4ML5EQ+NDd0nk1LUtI=","salt":"AfTujle13yiyB1I6vt9RSQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
83ceb5a9-fdbb-4c92-b86f-07e2ec95f3bb	\N	password	ddfbee3d-4d40-435a-a705-858ae8a187d2	1719918778385	My password	{"value":"PCO7fYpisG+30NrAvSz66BAmSA+gAsa7rK67yUM7qEs=","salt":"obKezgvpsJq0OvUCxJT5Pg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
884f53f7-6914-46f2-b009-a5b89e21a723	\N	password	f44eb987-d946-4275-b1b9-2b7cd4a26034	1719918807641	My password	{"value":"ohLczksfDiw6WoLNcWtjntqzj2NBawIqtrJLWoFNEI4=","salt":"scCPOTFNolEXqpPXgYgtEg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
7629224f-55c9-4189-b4f9-841f5c3634a7	\N	password	de68acd1-141e-470b-a81b-7ca70276086c	1738750941796	My password	{"value":"tcvuAtMAgfDbBkgX7sXiKHoC0P4mWVXkOSt2uIEXnds=","salt":"XRA+k0LDdgGx9M3HMkwmKQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
95c12fb7-fc21-4588-adcb-e3680a8d747c	\N	password	d0910d8b-cf45-403a-8339-2a3918135be7	1739178751067	My password	{"value":"iD5CJow1kQD9w0GjZBWF1+NCuUcUIblhzapMfXEMfkM=","salt":"79FvWVeUo3l9YkzXF0af/w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2023-11-16 16:32:01.267491	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.23.2	\N	\N	0148720780
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2023-11-16 16:32:01.295177	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.23.2	\N	\N	0148720780
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2023-11-16 16:32:01.318298	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.23.2	\N	\N	0148720780
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2023-11-16 16:32:01.321107	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.23.2	\N	\N	0148720780
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2023-11-16 16:32:01.391148	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.23.2	\N	\N	0148720780
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2023-11-16 16:32:01.401994	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.23.2	\N	\N	0148720780
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2023-11-16 16:32:01.454249	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.23.2	\N	\N	0148720780
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2023-11-16 16:32:01.467961	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.23.2	\N	\N	0148720780
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2023-11-16 16:32:01.474051	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.23.2	\N	\N	0148720780
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2023-11-16 16:32:01.529361	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.23.2	\N	\N	0148720780
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2023-11-16 16:32:01.561436	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	0148720780
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2023-11-16 16:32:01.568052	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	0148720780
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2023-11-16 16:32:01.579193	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	0148720780
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-11-16 16:32:01.590587	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.23.2	\N	\N	0148720780
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-11-16 16:32:01.591789	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	0148720780
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-11-16 16:32:01.594003	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.23.2	\N	\N	0148720780
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-11-16 16:32:01.596943	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.23.2	\N	\N	0148720780
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2023-11-16 16:32:01.62747	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.23.2	\N	\N	0148720780
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2023-11-16 16:32:01.653468	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.23.2	\N	\N	0148720780
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2023-11-16 16:32:01.656759	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.23.2	\N	\N	0148720780
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2023-11-16 16:32:01.663766	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.23.2	\N	\N	0148720780
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2023-11-16 16:32:01.666033	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.23.2	\N	\N	0148720780
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2023-11-16 16:32:01.678183	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.23.2	\N	\N	0148720780
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2023-11-16 16:32:01.681296	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.23.2	\N	\N	0148720780
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2023-11-16 16:32:01.682486	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.23.2	\N	\N	0148720780
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2023-11-16 16:32:01.702304	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.23.2	\N	\N	0148720780
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2023-11-16 16:32:01.751076	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.23.2	\N	\N	0148720780
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2023-11-16 16:32:01.753763	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.23.2	\N	\N	0148720780
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2023-11-16 16:32:01.787659	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.23.2	\N	\N	0148720780
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2023-11-16 16:32:01.795608	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.23.2	\N	\N	0148720780
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2023-11-16 16:32:01.806792	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.23.2	\N	\N	0148720780
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2023-11-16 16:32:01.809551	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.23.2	\N	\N	0148720780
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-11-16 16:32:01.814167	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	0148720780
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-11-16 16:32:01.816338	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.23.2	\N	\N	0148720780
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-11-16 16:32:01.835459	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.23.2	\N	\N	0148720780
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2023-11-16 16:32:01.838132	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.23.2	\N	\N	0148720780
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-11-16 16:32:01.84145	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	0148720780
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2023-11-16 16:32:01.843704	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.23.2	\N	\N	0148720780
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2023-11-16 16:32:01.845967	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.23.2	\N	\N	0148720780
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-11-16 16:32:01.846979	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.23.2	\N	\N	0148720780
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-11-16 16:32:01.848687	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.23.2	\N	\N	0148720780
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2023-11-16 16:32:01.851325	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.23.2	\N	\N	0148720780
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-11-16 16:32:01.933037	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.23.2	\N	\N	0148720780
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2023-11-16 16:32:01.935883	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.23.2	\N	\N	0148720780
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-11-16 16:32:01.940155	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.23.2	\N	\N	0148720780
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-11-16 16:32:01.942521	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.23.2	\N	\N	0148720780
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-11-16 16:32:01.943439	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.23.2	\N	\N	0148720780
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-11-16 16:32:01.967197	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.23.2	\N	\N	0148720780
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-11-16 16:32:01.969563	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.23.2	\N	\N	0148720780
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2023-11-16 16:32:01.992291	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.23.2	\N	\N	0148720780
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2023-11-16 16:32:02.016072	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.23.2	\N	\N	0148720780
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2023-11-16 16:32:02.017994	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	0148720780
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2023-11-16 16:32:02.020186	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.23.2	\N	\N	0148720780
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2023-11-16 16:32:02.021357	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.23.2	\N	\N	0148720780
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-11-16 16:32:02.024816	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.23.2	\N	\N	0148720780
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-11-16 16:32:02.027415	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.23.2	\N	\N	0148720780
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-11-16 16:32:02.042495	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.23.2	\N	\N	0148720780
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-11-16 16:32:02.092458	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.23.2	\N	\N	0148720780
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2023-11-16 16:32:02.107494	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.23.2	\N	\N	0148720780
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2023-11-16 16:32:02.110462	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.23.2	\N	\N	0148720780
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-11-16 16:32:02.11472	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.23.2	\N	\N	0148720780
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-11-16 16:32:02.118356	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.23.2	\N	\N	0148720780
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2023-11-16 16:32:02.120561	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.23.2	\N	\N	0148720780
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2023-11-16 16:32:02.121983	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.23.2	\N	\N	0148720780
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2023-11-16 16:32:02.12316	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.23.2	\N	\N	0148720780
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2023-11-16 16:32:02.130099	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.23.2	\N	\N	0148720780
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2023-11-16 16:32:02.132885	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.23.2	\N	\N	0148720780
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2023-11-16 16:32:02.135316	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.23.2	\N	\N	0148720780
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2023-11-16 16:32:02.14017	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.23.2	\N	\N	0148720780
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2023-11-16 16:32:02.142724	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.23.2	\N	\N	0148720780
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2023-11-16 16:32:02.144569	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.23.2	\N	\N	0148720780
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-11-16 16:32:02.147128	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	0148720780
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-11-16 16:32:02.150538	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	0148720780
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-11-16 16:32:02.152899	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	0148720780
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-11-16 16:32:02.160372	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.23.2	\N	\N	0148720780
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-11-16 16:32:02.163648	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.23.2	\N	\N	0148720780
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-11-16 16:32:02.165515	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.23.2	\N	\N	0148720780
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-11-16 16:32:02.166489	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.23.2	\N	\N	0148720780
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-11-16 16:32:02.174215	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.23.2	\N	\N	0148720780
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-11-16 16:32:02.176988	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.23.2	\N	\N	0148720780
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-11-16 16:32:02.180373	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.23.2	\N	\N	0148720780
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-11-16 16:32:02.181169	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	0148720780
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-11-16 16:32:02.1832	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	0148720780
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-11-16 16:32:02.184182	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	0148720780
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-11-16 16:32:02.188099	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.23.2	\N	\N	0148720780
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2023-11-16 16:32:02.19031	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.23.2	\N	\N	0148720780
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-11-16 16:32:02.193218	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.23.2	\N	\N	0148720780
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-11-16 16:32:02.19764	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.23.2	\N	\N	0148720780
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-11-16 16:32:02.200319	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.23.2	\N	\N	0148720780
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-11-16 16:32:02.203123	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.23.2	\N	\N	0148720780
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-11-16 16:32:02.206103	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	0148720780
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-11-16 16:32:02.210349	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.23.2	\N	\N	0148720780
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-11-16 16:32:02.211522	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.23.2	\N	\N	0148720780
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-11-16 16:32:02.216134	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.23.2	\N	\N	0148720780
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-11-16 16:32:02.217654	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.23.2	\N	\N	0148720780
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-11-16 16:32:02.220546	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.23.2	\N	\N	0148720780
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-11-16 16:32:02.22627	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	0148720780
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-11-16 16:32:02.227177	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	0148720780
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-11-16 16:32:02.231831	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	0148720780
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-11-16 16:32:02.237117	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	0148720780
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-11-16 16:32:02.238343	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	0148720780
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-11-16 16:32:02.242244	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.23.2	\N	\N	0148720780
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-11-16 16:32:02.244296	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.23.2	\N	\N	0148720780
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2023-11-16 16:32:02.248954	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.23.2	\N	\N	0148720780
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2023-11-16 16:32:02.25403	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.23.2	\N	\N	0148720780
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2023-11-16 16:32:02.256697	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.23.2	\N	\N	0148720780
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2023-11-16 16:32:02.258815	107	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.23.2	\N	\N	0148720780
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-11-16 16:32:02.263654	108	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.23.2	\N	\N	0148720780
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-11-16 16:32:02.264733	109	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.23.2	\N	\N	0148720780
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-11-16 16:32:02.267418	110	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	0148720780
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2023-11-16 16:32:02.269447	111	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.23.2	\N	\N	0148720780
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2023-11-16 16:32:02.284033	112	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.23.2	\N	\N	0148720780
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2023-11-16 16:32:02.286165	113	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.23.2	\N	\N	0148720780
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2023-11-16 16:32:02.289664	114	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.23.2	\N	\N	0148720780
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2023-11-16 16:32:02.292571	115	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.23.2	\N	\N	0148720780
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
cb748a80-a440-40dc-ba38-53857fbff49b	aa898c53-8064-4a3c-87ff-2759bc55813a	f
cb748a80-a440-40dc-ba38-53857fbff49b	b3a6718f-bc6d-4e9e-9dd1-1cba829e1962	t
cb748a80-a440-40dc-ba38-53857fbff49b	8a451c75-1e82-40c8-844c-effc3e8997da	t
cb748a80-a440-40dc-ba38-53857fbff49b	feb05054-e00e-4eae-ae2b-2aacad60ff56	t
cb748a80-a440-40dc-ba38-53857fbff49b	a9dc70ea-284e-430e-bf27-23bed1b9038f	f
cb748a80-a440-40dc-ba38-53857fbff49b	9163e38c-4fc7-48cd-a7f0-62e0bc6ee764	f
cb748a80-a440-40dc-ba38-53857fbff49b	5edcf47d-a0a6-49ad-914d-b03cccb0272f	t
cb748a80-a440-40dc-ba38-53857fbff49b	b2a098b6-354a-4122-b4dd-6deaf75c826c	t
cb748a80-a440-40dc-ba38-53857fbff49b	ed47a062-505e-4cbd-a35d-853b905165d5	f
cb748a80-a440-40dc-ba38-53857fbff49b	ac7833ff-d882-4714-a621-65ff8913ce37	t
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	a980e909-9ebc-42f0-b919-273f948c9e53	f
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	52d8e236-5515-4590-9f33-a6a3c96a3395	t
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	fa1609b7-8e09-4b8a-8cba-074a6f174fdc	t
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	f6a79dc2-3f88-4c24-9cf4-45b9231a04c7	t
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	fc6fbe06-c104-4561-9fe3-74486bb46212	f
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	80ffea1b-8dd5-4c11-92a9-f8090cc08ab1	f
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	bf1fe07f-6faa-432a-aa64-57dbf2bcb443	t
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	7241ba22-96f1-45ff-8497-ae6343f7cc91	f
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb	t
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	71427592-7de6-4d12-b8bc-f96289726cfd	t
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	dc866a59-7994-42f6-9625-4c5a2705e00d	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	7d9df514-e8f6-4e2b-bf99-36e0a2a05610	t
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	c0d0b991-495b-4484-bc1f-24edcf8a7fca	t
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	8e6883b3-ba8d-4ef6-97b2-092673d11aed	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	120b2b69-b8a2-4380-9cd9-3cb49886a804	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ac1492d2-e3bd-4242-affe-f372e109f284	t
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	57e8e861-c01e-444a-b017-939b46021f12	t
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	c054c6af-66f1-4a65-b61d-d0ba709be07e	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	973b4773-66e0-4036-903e-922011f627b9	t
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6b5ae4d9-135f-4c09-875e-a9314338f847	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6f886051-b217-4e14-9f52-7a7b30e2f47e	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	096c8c1f-dacf-4ec4-a9e2-18dd3ec7445a	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	03d185fa-0e2a-47af-a2da-cd4b600619b6	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	00bf4cec-949b-4725-9277-0e64219a6ffc	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	9d05b36e-dd7c-4980-b974-834f78aae1f9	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ca9ecc5b-1a1e-4431-9835-9612e24a660f	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ec15f768-3f29-4ec3-9030-62dfcb9491e3	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	aa02a150-384e-4574-9f0f-844847b2397d	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	73014569-6884-40b6-a0bf-83e3560f9ee5	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	f4c6c4b5-b7a6-4bb4-8eb3-3dad37064741	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	196b6d76-880c-43b7-99c4-7e171a4177bf	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	e203eb9b-87ef-41f3-bb70-6cf0519cf09a	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	f00cc02d-3685-4a80-ab60-807977e25269	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	4d2dee30-44e9-47ba-9a61-24911ce5575f	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	d63dac92-75f1-45ce-8df5-85b25ca56e84	f
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	0287610d-5a4f-4818-84e1-b1a9c0b8e914	t
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	99bf78ca-c748-4846-88ba-c829dbedcba0	f
e8cfaa41-db82-4979-8f75-429ff43b53b9	9bf965e9-5b33-499e-93a9-a51b92d82d49	f
e8cfaa41-db82-4979-8f75-429ff43b53b9	a882fa49-d884-4231-8b49-2cb54d8b4b3c	t
e8cfaa41-db82-4979-8f75-429ff43b53b9	8eb116e9-672d-4906-af77-9d4005fb7bc9	t
e8cfaa41-db82-4979-8f75-429ff43b53b9	3e197c3e-4383-4fda-bdd7-51c57f4cb087	t
e8cfaa41-db82-4979-8f75-429ff43b53b9	1cdc4b9f-a3ce-456d-9290-d014bcb95ff5	f
e8cfaa41-db82-4979-8f75-429ff43b53b9	90db1804-b170-4b99-be1d-64a8a40514a2	f
e8cfaa41-db82-4979-8f75-429ff43b53b9	0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac	t
e8cfaa41-db82-4979-8f75-429ff43b53b9	6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd	t
e8cfaa41-db82-4979-8f75-429ff43b53b9	f7a19d3c-7e9c-4b6c-b123-aa14d4581a24	f
e8cfaa41-db82-4979-8f75-429ff43b53b9	a1ed248a-e826-4058-9919-32a365698eb2	t
e8cfaa41-db82-4979-8f75-429ff43b53b9	c0f52a89-0999-433f-812c-f924e13dfde2	t
e8cfaa41-db82-4979-8f75-429ff43b53b9	6e7c245c-a1ba-4a52-a6ce-52626366650f	t
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	aeb4cff8-2781-4f07-9965-7cce39afb2e2	t
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	ea68e07d-9375-4f5c-84d2-5958affd9ce3	t
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	57151a45-3d35-4b24-9075-3fdf3f9545c8	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
bd4fddad-a945-48f0-9ebe-d3e8e6b59b55	cef67c5e-06bd-4d12-a43f-44f6c5946d38
37182854-cfca-4b76-918f-6c58bef5ad55	cef67c5e-06bd-4d12-a43f-44f6c5946d38
bd4fddad-a945-48f0-9ebe-d3e8e6b59b55	7d30b1c6-db75-451a-89cd-4e9dbec118af
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
cef67c5e-06bd-4d12-a43f-44f6c5946d38	sikved_admins	 	c3ee8ea6-caa2-48fa-95c4-679f16ec203a
7d30b1c6-db75-451a-89cd-4e9dbec118af	sikved_guests	 	c3ee8ea6-caa2-48fa-95c4-679f16ec203a
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
f245c712-a381-4ac4-bb2e-193e9a3ec9a6	cb748a80-a440-40dc-ba38-53857fbff49b	f	${role_default-roles}	default-roles-master	cb748a80-a440-40dc-ba38-53857fbff49b	\N	\N
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	cb748a80-a440-40dc-ba38-53857fbff49b	f	${role_admin}	admin	cb748a80-a440-40dc-ba38-53857fbff49b	\N	\N
b5c78e84-1a6b-450b-b278-85a2312c975c	cb748a80-a440-40dc-ba38-53857fbff49b	f	${role_create-realm}	create-realm	cb748a80-a440-40dc-ba38-53857fbff49b	\N	\N
76d177e2-21d6-4e23-8dd5-4285e2528d85	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_create-client}	create-client	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
5b15458b-c40b-4cfd-9d9b-db14d3fff575	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_view-realm}	view-realm	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
2fece0a1-2a5c-4a47-a1ad-a036d6352af5	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_view-users}	view-users	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
433641df-1120-422c-86e9-60b6bff4597f	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_view-clients}	view-clients	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
3e324bc9-f1d9-4d63-970c-c2fbaac02817	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_view-events}	view-events	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
31a283d2-03b1-48b1-9afd-62878dd92683	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_view-identity-providers}	view-identity-providers	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
1ec2649a-2744-4919-8877-bc677af4905b	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_view-authorization}	view-authorization	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
adce5f0b-9e39-4f79-bb45-27c286b23fc7	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_manage-realm}	manage-realm	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
4c35a08e-2664-429e-8902-6f877a5ed5c3	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_manage-users}	manage-users	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
99848c6c-4a60-4ac1-af43-3956a3991c65	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_manage-clients}	manage-clients	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
748ae45b-f047-4377-b285-dce53551b2f7	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_manage-events}	manage-events	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
b8c29d27-4dcf-465b-b2ec-4cf5b841cbad	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_manage-identity-providers}	manage-identity-providers	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
c5f52507-71ba-4a4f-81ea-e15335a5b78b	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_manage-authorization}	manage-authorization	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
ceab24b2-08ad-4fd2-ba79-251902970d33	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_query-users}	query-users	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
8757ac14-5266-4859-a59d-1101e11f3f15	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_query-clients}	query-clients	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
6499e4b9-4793-46ae-950e-54b888b4471b	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_query-realms}	query-realms	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
9a74f32a-d8b9-4d5a-ad95-83990c07a1e4	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_query-groups}	query-groups	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
f2e831cb-e2fc-4433-b7cc-c0e663cededd	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	t	${role_view-profile}	view-profile	cb748a80-a440-40dc-ba38-53857fbff49b	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	\N
2ff7c508-8ef1-4fac-9136-eada415094a9	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	t	${role_manage-account}	manage-account	cb748a80-a440-40dc-ba38-53857fbff49b	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	\N
2391d0ba-f3a1-446d-8a32-bf828e133f26	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	t	${role_manage-account-links}	manage-account-links	cb748a80-a440-40dc-ba38-53857fbff49b	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	\N
3fbbe619-e298-467e-8ee5-81171eed9681	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	t	${role_view-applications}	view-applications	cb748a80-a440-40dc-ba38-53857fbff49b	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	\N
a9ee7d22-cfe9-41c6-a263-87e470eb50d2	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	t	${role_view-consent}	view-consent	cb748a80-a440-40dc-ba38-53857fbff49b	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	\N
e7d71dd1-3585-43bd-9491-2c4b5bdd4640	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	t	${role_manage-consent}	manage-consent	cb748a80-a440-40dc-ba38-53857fbff49b	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	\N
75e31298-e64c-4861-baf3-9eb7a091a2cb	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	t	${role_view-groups}	view-groups	cb748a80-a440-40dc-ba38-53857fbff49b	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	\N
8fc68c19-516d-45eb-8308-b4073ca4bbda	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	t	${role_delete-account}	delete-account	cb748a80-a440-40dc-ba38-53857fbff49b	d5282b6f-d7eb-4a78-9b7f-a1b61219229d	\N
025cdfca-07ff-4132-9456-f8e4204a3b06	d01dc9af-1719-4601-ad41-5d5e70e3cd24	t	${role_read-token}	read-token	cb748a80-a440-40dc-ba38-53857fbff49b	d01dc9af-1719-4601-ad41-5d5e70e3cd24	\N
d60c5824-7589-40dc-b9d6-d4bc80a9b782	dc9be43b-8068-492e-a0f5-9d96e465557c	t	${role_impersonation}	impersonation	cb748a80-a440-40dc-ba38-53857fbff49b	dc9be43b-8068-492e-a0f5-9d96e465557c	\N
48a32976-c284-4195-b294-368b5c711cb2	cb748a80-a440-40dc-ba38-53857fbff49b	f	${role_offline-access}	offline_access	cb748a80-a440-40dc-ba38-53857fbff49b	\N	\N
a2c26b9b-0f03-45c5-b87a-7c61b95f734c	cb748a80-a440-40dc-ba38-53857fbff49b	f	${role_uma_authorization}	uma_authorization	cb748a80-a440-40dc-ba38-53857fbff49b	\N	\N
87f1ba85-55c3-4fd0-aded-2235a0979bcf	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	f	${role_default-roles}	default-roles-local	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	\N	\N
92e6eb9f-2ba4-433d-9a23-e080195a8195	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_create-client}	create-client	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
0a631c11-8629-40c0-905c-745199883a13	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_view-realm}	view-realm	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
05d66c65-8028-438c-90f7-fc172be4f9b8	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_view-users}	view-users	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
6a6f5fde-a01c-46e9-b28b-2ee8264fdcb2	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_view-clients}	view-clients	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
dee95d4c-f1d0-4725-92c1-2d3c9546bb72	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_view-events}	view-events	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
de6dec9c-4563-4153-8b63-5d1e89b5df3b	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_view-identity-providers}	view-identity-providers	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
7c6cdabc-4996-4b62-909b-ef4baae19a4d	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_view-authorization}	view-authorization	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
11f6016e-c74c-4e05-9471-ef20800e5dbc	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_manage-realm}	manage-realm	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
40f01fe2-8049-4e44-a2ab-d47b6e2e9b58	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_manage-users}	manage-users	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
b912be96-99a6-424e-b6a8-3e8fec7709fb	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_manage-clients}	manage-clients	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
ea1b8a08-fb79-419a-8bc6-4a2f83bda4b2	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_manage-events}	manage-events	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
497d2e6f-188a-45bd-80d1-7a218453cde5	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_manage-identity-providers}	manage-identity-providers	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
8d526b7c-c61f-4441-9019-18397563a6ed	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_manage-authorization}	manage-authorization	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
b6b00af4-27d2-4b27-8d2d-c88ba6b88d45	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_query-users}	query-users	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
f3ce16f3-ada5-4553-bdb3-881434f74012	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_query-clients}	query-clients	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
8ac9e5b5-db2c-4215-a495-c1af7f8a2bbf	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_query-realms}	query-realms	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
996a0a22-d936-4031-b861-dd5c21dfda2e	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_query-groups}	query-groups	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
b2b88ffe-1184-4cd2-b8cc-56c3ff17a86f	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_realm-admin}	realm-admin	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
26c048e0-d9fe-471f-a4b6-210ec1da02cc	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_create-client}	create-client	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
e94bfca1-ac20-4d74-ab5c-6ec647cf671e	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_view-realm}	view-realm	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
7377fcb6-7221-4ca3-a459-36f02ba5edc9	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_view-users}	view-users	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
baf8b571-25a8-4ecd-bdd1-08d836e7da62	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_view-clients}	view-clients	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
1d7e839f-fa15-489e-b3ea-2953fce4e34c	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_view-events}	view-events	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
57b752ff-3564-49ff-9eb6-7269176bbbac	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_view-identity-providers}	view-identity-providers	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
9f1c393d-f840-48a1-bb47-9909a3a78edb	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_view-authorization}	view-authorization	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
5524d04c-798a-4247-be0b-21bd080e210b	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_manage-realm}	manage-realm	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
a26d1e66-fedb-4bdd-b79b-fd7f9415f672	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_manage-users}	manage-users	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
c9a8322c-3f7e-4eb6-ad25-2c880d34f240	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_manage-clients}	manage-clients	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
176bf30d-ee43-4d73-aa01-43d59e466b43	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_manage-events}	manage-events	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
92f17868-9ca5-4c43-b91d-dd3543c6b586	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_manage-identity-providers}	manage-identity-providers	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
c2824b22-e600-49ca-a6cc-21647cb39bc4	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_manage-authorization}	manage-authorization	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
ea16b16a-930f-40a8-9c92-0ac5c020f6ec	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_query-users}	query-users	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
43966c0c-1f1a-4048-9123-662ba43a0c05	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_query-clients}	query-clients	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
9d6e9db0-04a0-466b-ba8f-9296bdcc07cc	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_query-realms}	query-realms	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
4e72d253-af63-4428-b857-cd0254bda9e3	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_query-groups}	query-groups	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
98c37d12-5f6d-4633-8a89-68a03e518dc8	865f4804-4069-4a4c-b155-9a16686c3465	t	${role_view-profile}	view-profile	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	865f4804-4069-4a4c-b155-9a16686c3465	\N
22001e30-8364-49d3-a29d-2ec575b3ae24	865f4804-4069-4a4c-b155-9a16686c3465	t	${role_manage-account}	manage-account	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	865f4804-4069-4a4c-b155-9a16686c3465	\N
f8ddf4f9-0548-4cab-8006-7bea086140c5	865f4804-4069-4a4c-b155-9a16686c3465	t	${role_manage-account-links}	manage-account-links	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	865f4804-4069-4a4c-b155-9a16686c3465	\N
a03062e1-c5b7-4522-9f30-1a2a77b97e70	865f4804-4069-4a4c-b155-9a16686c3465	t	${role_view-applications}	view-applications	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	865f4804-4069-4a4c-b155-9a16686c3465	\N
ce3233e3-c8ff-4c0c-b985-9b8cbe0fb271	865f4804-4069-4a4c-b155-9a16686c3465	t	${role_view-consent}	view-consent	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	865f4804-4069-4a4c-b155-9a16686c3465	\N
bd4e05c5-7f04-4a4e-89aa-3a0f670212a3	865f4804-4069-4a4c-b155-9a16686c3465	t	${role_manage-consent}	manage-consent	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	865f4804-4069-4a4c-b155-9a16686c3465	\N
f0ddedc4-0626-40a9-b37d-d7084797484a	865f4804-4069-4a4c-b155-9a16686c3465	t	${role_view-groups}	view-groups	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	865f4804-4069-4a4c-b155-9a16686c3465	\N
2b8ea875-cce1-4cc1-a59f-e0a33c453514	865f4804-4069-4a4c-b155-9a16686c3465	t	${role_delete-account}	delete-account	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	865f4804-4069-4a4c-b155-9a16686c3465	\N
771d9c50-2fea-422a-bca8-9de5ba209ace	4ba52d1e-3069-4e20-9ae8-633d3f825441	t	${role_impersonation}	impersonation	cb748a80-a440-40dc-ba38-53857fbff49b	4ba52d1e-3069-4e20-9ae8-633d3f825441	\N
fd988319-a2ac-477d-826d-b4bcb74db223	c84f053d-bd16-440b-b90c-2d3eabed8ea5	t	${role_impersonation}	impersonation	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	c84f053d-bd16-440b-b90c-2d3eabed8ea5	\N
47953a35-f9e2-47df-94ad-545ba4764dfd	0de05ff6-b163-43ce-b5a7-aa4e3a1d62ec	t	${role_read-token}	read-token	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	0de05ff6-b163-43ce-b5a7-aa4e3a1d62ec	\N
d6613e2d-56a6-41e7-9cca-cc08b6535a89	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	f	${role_offline-access}	offline_access	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	\N	\N
ce9b5938-d7e4-492c-a074-a27204bd3554	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	f	${role_uma_authorization}	uma_authorization	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	\N	\N
bd4fddad-a945-48f0-9ebe-d3e8e6b59b55	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	f		sikved_reader	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	\N	\N
37182854-cfca-4b76-918f-6c58bef5ad55	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	f		sikved_writer	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	\N	\N
58c65169-8fe0-477c-a012-2f1d2f18072e	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	f		toldst	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	\N	\N
7b7d5b6c-1032-4a5a-9fe2-102d056786cf	e8cfaa41-db82-4979-8f75-429ff43b53b9	f		IP.DigitalLogbog.Aktoer.Sagsbehandler.Kontrollant.PRG	e8cfaa41-db82-4979-8f75-429ff43b53b9	\N	\N
a55de2ff-a941-430e-9168-daa93dcfc864	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_view-clients}	view-clients	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
b637c4a6-6f69-4d77-aaab-4941df2ca04d	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_view-events}	view-events	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
80e88b8f-0b3c-4e57-85e6-514b01f93b26	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_view-identity-providers}	view-identity-providers	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
29c6f6da-ced3-4c7f-a19c-81e76a0f984a	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_view-authorization}	view-authorization	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
8823f58f-5fbf-412e-bd11-c94e0467c095	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_manage-realm}	manage-realm	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
7239a397-b856-45c3-8426-c1d5ca194332	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_manage-users}	manage-users	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
bf63ee79-228b-4cd8-a5f6-ac481d701672	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_manage-clients}	manage-clients	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
65b905f9-d2a1-4a88-b361-780f85c5c0a7	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	f	${role_default-roles}	default-roles-dcs	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	\N	\N
1e48f0ed-175a-47e1-9fad-364778cf9c30	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_create-client}	create-client	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
4030b3c4-1d98-4372-8db4-78675a297124	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_view-realm}	view-realm	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
18e9738c-3f42-45a3-adbb-6a29ac761bad	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_view-users}	view-users	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
a29987b3-aca3-4744-b413-2a7c3c5e8a3b	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_manage-events}	manage-events	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
15c925a0-154d-4bc4-9c9a-2378813bfc12	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_manage-identity-providers}	manage-identity-providers	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
c1800c56-4d88-4a03-9b85-ee9807728978	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_manage-authorization}	manage-authorization	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
f2fa273d-dd77-470e-8b30-b209783c4d69	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_query-users}	query-users	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
391621a5-370f-49ad-b185-13f59a618a0e	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_query-clients}	query-clients	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
941f09c9-2d9a-4271-afaf-e77cfd389829	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_query-realms}	query-realms	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
9c657277-4b98-4c74-8aa3-b887e3a4319e	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_query-groups}	query-groups	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
c1997c7f-fabb-48bb-9d62-f5645cd22983	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_realm-admin}	realm-admin	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
43171c12-49e5-4fec-a0ba-2153abfdd4bc	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_create-client}	create-client	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
787c68bb-2c83-4e9d-b46a-a0734c9859eb	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_view-realm}	view-realm	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
f5ab553a-c781-4d91-922f-f8ef945bfe49	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_view-users}	view-users	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
3a4f45a3-a783-4a0f-9db3-b54731ae87a4	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_view-clients}	view-clients	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
5bd6ef36-31fd-4b33-949f-986662ba64fc	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_view-events}	view-events	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
bf05d72a-a197-4ed2-89f1-b149836fdcfb	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_view-identity-providers}	view-identity-providers	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
5a37fcd8-0360-4ded-8161-6f148c3585ab	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_view-authorization}	view-authorization	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
d902b136-e674-4b31-859a-65924e376222	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_manage-realm}	manage-realm	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
ce7e2e03-7cfb-4bbf-b661-73c1aef628fa	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_manage-users}	manage-users	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
0943d7bd-2158-488c-af5d-01c1776146df	e8cfaa41-db82-4979-8f75-429ff43b53b9	f		IP.GUL.Aktør.Aftager-behandler.PRG	e8cfaa41-db82-4979-8f75-429ff43b53b9	\N	\N
9d85fa15-b145-4d71-adc0-64479cf03c3f	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_manage-clients}	manage-clients	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
e5e6cfa3-10e5-4769-a8ea-265c6ca39be4	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_manage-events}	manage-events	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
f755f875-c132-4964-9703-3028ecef82fb	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_manage-identity-providers}	manage-identity-providers	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
60c55f4f-4618-494e-820e-81b86c2ff1be	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_manage-authorization}	manage-authorization	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
b47b149e-b902-426f-aebc-92aed2f3061e	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_query-users}	query-users	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
bf83288b-2a9f-4841-8588-cb89c195f768	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_query-clients}	query-clients	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
862dc701-d8b3-4f0f-80a1-001a6a595867	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_query-realms}	query-realms	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
fecbb392-d514-4b80-816d-be6185a26309	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_query-groups}	query-groups	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
b460d6f3-aa20-4cd3-be73-78cb894dbdaf	ab24de49-f9f2-4708-8f42-3c51040d035b	t	${role_view-profile}	view-profile	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ab24de49-f9f2-4708-8f42-3c51040d035b	\N
ff242237-9887-404e-98e4-d57f4a568a00	ab24de49-f9f2-4708-8f42-3c51040d035b	t	${role_manage-account}	manage-account	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ab24de49-f9f2-4708-8f42-3c51040d035b	\N
190c4209-d0d8-4c2f-82c7-70915493861e	ab24de49-f9f2-4708-8f42-3c51040d035b	t	${role_manage-account-links}	manage-account-links	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ab24de49-f9f2-4708-8f42-3c51040d035b	\N
900fa69d-fee7-463e-9dd3-576b765bc478	ab24de49-f9f2-4708-8f42-3c51040d035b	t	${role_view-applications}	view-applications	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ab24de49-f9f2-4708-8f42-3c51040d035b	\N
8d4a096f-f630-4ec7-8181-519c282080ae	ab24de49-f9f2-4708-8f42-3c51040d035b	t	${role_view-consent}	view-consent	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ab24de49-f9f2-4708-8f42-3c51040d035b	\N
1f9c0276-fe0c-4bc7-a078-fb49c5a443b9	ab24de49-f9f2-4708-8f42-3c51040d035b	t	${role_manage-consent}	manage-consent	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ab24de49-f9f2-4708-8f42-3c51040d035b	\N
09c46b4f-931f-44fd-b41f-6bb1fee7f887	ab24de49-f9f2-4708-8f42-3c51040d035b	t	${role_view-groups}	view-groups	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ab24de49-f9f2-4708-8f42-3c51040d035b	\N
041e1e00-9edc-4d2b-b8c9-faefa33f64af	ab24de49-f9f2-4708-8f42-3c51040d035b	t	${role_delete-account}	delete-account	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ab24de49-f9f2-4708-8f42-3c51040d035b	\N
0befafa1-e682-4800-84b8-0cced3f13577	59e17908-b00e-489f-9d33-3b3b300f25da	t	${role_impersonation}	impersonation	cb748a80-a440-40dc-ba38-53857fbff49b	59e17908-b00e-489f-9d33-3b3b300f25da	\N
fb4d1686-8a7c-49fe-9018-de51515d9b93	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	t	${role_impersonation}	impersonation	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	6120afa1-0dce-4ec7-8fb5-74c7cf94a938	\N
f663d3b1-121c-4515-ae7a-507e9dfd0635	375b8a4c-a514-4211-9300-6ccd36393276	t	${role_read-token}	read-token	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	375b8a4c-a514-4211-9300-6ccd36393276	\N
d70bb390-df88-4695-ae78-0c536c755765	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	f	${role_offline-access}	offline_access	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	\N	\N
8c985109-1655-42fc-859e-eb026d2af38d	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	f	${role_uma_authorization}	uma_authorization	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	\N	\N
010539b9-48f9-4086-9b0a-78c87085c7cb	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	f		IP.DigitalLogbog.Aktoer.Virksomhed.Angiver.PRG	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	\N	\N
dcd95271-392e-4636-aa12-4aa46e20ef5e	e8cfaa41-db82-4979-8f75-429ff43b53b9	f	${role_default-roles}	default-roles-azure	e8cfaa41-db82-4979-8f75-429ff43b53b9	\N	\N
25eb64b0-b39f-4120-9b22-5c7cc540089e	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_create-client}	create-client	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
ea001888-d70c-4fce-bd92-5ec7c2121a8b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_view-realm}	view-realm	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
623f19b9-2836-4d8d-9542-1fd94f126e3f	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_view-users}	view-users	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
44d2cec3-d190-4e7f-84c6-51b10130c55a	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_view-clients}	view-clients	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
922640ca-9072-4285-b098-5e78e6742799	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_view-events}	view-events	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
530481e3-5049-4df4-bcdb-0b6c7ff2c8c3	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_view-identity-providers}	view-identity-providers	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
2b54e736-7516-47bf-9471-a40b1c0aad07	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_view-authorization}	view-authorization	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
0e046bc4-e42e-4514-9d94-70096b0ac90f	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_manage-realm}	manage-realm	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
4c05170e-2511-4a2f-b764-252d02003921	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_manage-users}	manage-users	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
76f38b87-ac07-4453-be87-2aa0c52f3014	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_manage-clients}	manage-clients	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
31654f2f-ffbc-48b2-ade1-acf5aa3c9d08	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_manage-events}	manage-events	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
74b8cd49-dd54-4d5a-9ca7-c5629c7d79cc	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_manage-identity-providers}	manage-identity-providers	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
17f5dd03-cbe6-4d13-b35f-2a387cb8a326	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_manage-authorization}	manage-authorization	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
fad71b2d-abe4-47cd-a0f5-bcb58ec1e717	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_query-users}	query-users	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
cd862773-9af1-4158-bdcf-82f75874ca60	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_query-clients}	query-clients	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
19f59c90-3b21-4028-aefa-e85aed04d6a7	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_query-realms}	query-realms	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
7c9c6b67-2b97-4af7-a916-eea1e6e84981	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_query-groups}	query-groups	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
20482c62-3dd6-444d-8439-0d2625fffb2a	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_realm-admin}	realm-admin	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
a7033cdc-8149-48b7-a161-67cbf4f7c106	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_create-client}	create-client	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
bc2e5ffd-8311-49a4-a12c-25d53578207f	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_view-realm}	view-realm	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
6c1f04f5-9eee-4f0f-81a3-e6cccde85c8e	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_view-users}	view-users	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
3b50bbef-f5b9-4d20-bf0d-12fb8b8a9fee	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_view-clients}	view-clients	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
005dca18-3c57-48a5-9f64-d573a4889cd0	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_view-events}	view-events	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
1c433cb7-ce51-471f-8fb5-3ed5157b32df	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_view-identity-providers}	view-identity-providers	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
2f13248e-4223-4e49-9f0a-63966ecef0bf	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_view-authorization}	view-authorization	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
be34b051-6b93-4cc6-8a59-aa2265659569	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_manage-realm}	manage-realm	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
14de4807-6832-4a67-a306-fe1cbb2cea08	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_manage-users}	manage-users	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
c5d5e569-5d43-4c60-978c-d4af75362682	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_manage-clients}	manage-clients	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
65ff09f9-071f-4722-a7a2-667d0affed10	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_manage-events}	manage-events	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
dbb5466f-037e-4455-b37f-caccf038ef82	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_manage-identity-providers}	manage-identity-providers	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
d1cf435c-dcad-4046-90a9-7a0a4afd4e10	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_manage-authorization}	manage-authorization	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
4e9c27e8-07f7-4460-bb71-5a2c0f2ea123	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_query-users}	query-users	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
952475fc-aa48-413e-96de-4377b541b943	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_query-clients}	query-clients	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
d579ed1a-3f09-40ee-ae1d-a6192e381f54	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_query-realms}	query-realms	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
ddf98d12-2274-4296-b2d7-7eab6fb30d42	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_query-groups}	query-groups	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
36d646d2-8807-4153-85cd-4879156363be	dc94d641-7e97-455e-970b-f3e58ae7eb03	t	${role_view-profile}	view-profile	e8cfaa41-db82-4979-8f75-429ff43b53b9	dc94d641-7e97-455e-970b-f3e58ae7eb03	\N
2010040e-4eb5-418d-a8f9-a15b68d029e6	dc94d641-7e97-455e-970b-f3e58ae7eb03	t	${role_manage-account}	manage-account	e8cfaa41-db82-4979-8f75-429ff43b53b9	dc94d641-7e97-455e-970b-f3e58ae7eb03	\N
94a133ca-161c-4603-aa98-d62a7428b5e0	dc94d641-7e97-455e-970b-f3e58ae7eb03	t	${role_manage-account-links}	manage-account-links	e8cfaa41-db82-4979-8f75-429ff43b53b9	dc94d641-7e97-455e-970b-f3e58ae7eb03	\N
8bcb7b38-67c8-44bd-abe0-62c823b866f4	dc94d641-7e97-455e-970b-f3e58ae7eb03	t	${role_view-applications}	view-applications	e8cfaa41-db82-4979-8f75-429ff43b53b9	dc94d641-7e97-455e-970b-f3e58ae7eb03	\N
1d01e7e7-a063-4607-8e57-4f0ec6e114fb	dc94d641-7e97-455e-970b-f3e58ae7eb03	t	${role_view-consent}	view-consent	e8cfaa41-db82-4979-8f75-429ff43b53b9	dc94d641-7e97-455e-970b-f3e58ae7eb03	\N
14d077cf-5506-4d41-8d67-d0f50e0e6816	dc94d641-7e97-455e-970b-f3e58ae7eb03	t	${role_manage-consent}	manage-consent	e8cfaa41-db82-4979-8f75-429ff43b53b9	dc94d641-7e97-455e-970b-f3e58ae7eb03	\N
6af2680b-e78d-4393-8a2e-4d8fd4fbbce2	dc94d641-7e97-455e-970b-f3e58ae7eb03	t	${role_view-groups}	view-groups	e8cfaa41-db82-4979-8f75-429ff43b53b9	dc94d641-7e97-455e-970b-f3e58ae7eb03	\N
fa737895-a8bf-4e5c-9ff9-800069d389f5	dc94d641-7e97-455e-970b-f3e58ae7eb03	t	${role_delete-account}	delete-account	e8cfaa41-db82-4979-8f75-429ff43b53b9	dc94d641-7e97-455e-970b-f3e58ae7eb03	\N
04e89edf-ec67-4d71-be38-97e1510ad940	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	t	${role_impersonation}	impersonation	cb748a80-a440-40dc-ba38-53857fbff49b	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	\N
1d729b70-9c1a-474b-9e60-589dbcd9b475	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	t	${role_impersonation}	impersonation	e8cfaa41-db82-4979-8f75-429ff43b53b9	3ff011b8-ea83-42ee-a1c7-9fd2a477073d	\N
6b69d6b4-4e05-4db7-9995-2f9b74814914	0a438640-c32b-466a-99b8-536c23169b1f	t	${role_read-token}	read-token	e8cfaa41-db82-4979-8f75-429ff43b53b9	0a438640-c32b-466a-99b8-536c23169b1f	\N
5dcb867b-0e23-4df8-977a-2027505e10c2	e8cfaa41-db82-4979-8f75-429ff43b53b9	f	${role_offline-access}	offline_access	e8cfaa41-db82-4979-8f75-429ff43b53b9	\N	\N
f362c50a-09da-4a90-9a5e-064b2f84192f	e8cfaa41-db82-4979-8f75-429ff43b53b9	f	${role_uma_authorization}	uma_authorization	e8cfaa41-db82-4979-8f75-429ff43b53b9	\N	\N
138a198b-4098-4129-b535-9ded7069d8ae	e8cfaa41-db82-4979-8f75-429ff43b53b9	f		IP.GUL.Aktør.Udstiller-behandler.PRG	e8cfaa41-db82-4979-8f75-429ff43b53b9	\N	\N
9a686133-a145-45aa-8863-f21a6a22c0b4	e8cfaa41-db82-4979-8f75-429ff43b53b9	f		IP.GUL.Aktør.Udstiller-underskriver.PRG	e8cfaa41-db82-4979-8f75-429ff43b53b9	\N	\N
17a7a0c4-5ce6-42c2-a827-f8f6ddabda05	e8cfaa41-db82-4979-8f75-429ff43b53b9	f		IP.GUL.Aktør.Administrator.PRG	e8cfaa41-db82-4979-8f75-429ff43b53b9	\N	\N
083d0431-cea7-457a-add6-2ab47b887ccf	e8cfaa41-db82-4979-8f75-429ff43b53b9	f		IP.GUL.Aktør.Aftager-underskriver.PRG	e8cfaa41-db82-4979-8f75-429ff43b53b9	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
bkmjl	22.0.5	1700148722
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
fa66a7ba-bfe5-4965-aa71-6b99fb9737b2	audience resolve	openid-connect	oidc-audience-resolve-mapper	4389593f-caca-4f5a-9deb-3e2cc20892da	\N
5e9e6098-89d7-4775-b3f0-b0c3ad67bad0	locale	openid-connect	oidc-usermodel-attribute-mapper	7d83e93d-0083-4e82-994f-2da2b7a5ac46	\N
173b2cf5-a1f6-40a6-a1eb-1d40ed244b79	role list	saml	saml-role-list-mapper	\N	b3a6718f-bc6d-4e9e-9dd1-1cba829e1962
e4b8a370-ec29-4751-b1bd-5f922b4887c4	full name	openid-connect	oidc-full-name-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
884df239-a01f-4ed1-b2e5-f53104a0726b	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
1f297e6b-88cc-476b-9711-f226cab4e104	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
1c386642-740e-4cbc-a9a4-7981ee046320	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
587a158d-dcfa-4425-a3f5-dc86f74f8f1a	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
6018cd09-bad9-44a2-8ced-8b42b3fdf8ff	username	openid-connect	oidc-usermodel-attribute-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
b11b21f4-a746-4e1c-a598-c503bca2249a	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
b02e496b-fb56-4cf6-9c77-6ecb4c2d3fdf	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
78918ed1-8a03-4c04-96d2-8fbff0ec3bd8	website	openid-connect	oidc-usermodel-attribute-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
229e6963-4caf-43c5-a37c-0bfd40c0cb76	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
ae6ebded-9aa0-4c4a-b179-30e9c63942b8	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
6551ef87-1b7a-4d63-8002-dbf3ae40236b	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
9a86b7bd-a941-4bc7-b0b4-cf1fa1c86e74	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
da7981e6-0480-4086-941a-ca6b1bc9477a	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	8a451c75-1e82-40c8-844c-effc3e8997da
47c10257-f559-4c84-a26c-ada0f04bc2f0	email	openid-connect	oidc-usermodel-attribute-mapper	\N	feb05054-e00e-4eae-ae2b-2aacad60ff56
6901064a-71a0-4a24-8209-b78431f1665e	email verified	openid-connect	oidc-usermodel-property-mapper	\N	feb05054-e00e-4eae-ae2b-2aacad60ff56
e9e4ffec-3b23-4628-ac0e-e853c1cdd357	address	openid-connect	oidc-address-mapper	\N	a9dc70ea-284e-430e-bf27-23bed1b9038f
580bd027-0773-444b-b47e-a3d4e67a0caf	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	9163e38c-4fc7-48cd-a7f0-62e0bc6ee764
dc6a236c-a0da-4d50-ad81-e626c4440f47	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	9163e38c-4fc7-48cd-a7f0-62e0bc6ee764
02d1d3bb-f700-4ad0-b70f-14ac24d75899	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	5edcf47d-a0a6-49ad-914d-b03cccb0272f
31ec7994-396b-4ac4-9ebd-157ad9d3082a	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	5edcf47d-a0a6-49ad-914d-b03cccb0272f
792064c7-4c25-4889-b66c-8eafae8cb3ca	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	5edcf47d-a0a6-49ad-914d-b03cccb0272f
240dad0d-26e5-48d2-9766-dd4ff8c18de1	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	b2a098b6-354a-4122-b4dd-6deaf75c826c
c0a7e00e-4157-432c-b82f-fb5b6ecf8eb7	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	ed47a062-505e-4cbd-a35d-853b905165d5
dd40fed0-63ae-4bf6-91b5-f56f1bfa1b7a	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	ed47a062-505e-4cbd-a35d-853b905165d5
ccd18825-5d9b-435e-8cdb-82ec85f5340e	acr loa level	openid-connect	oidc-acr-mapper	\N	ac7833ff-d882-4714-a621-65ff8913ce37
0b32295a-d102-43bf-a44e-2bca5f2326ff	audience resolve	openid-connect	oidc-audience-resolve-mapper	2682a4aa-1e30-4d13-bd52-67435bb29ac2	\N
b57ca5c4-52d1-4819-9a17-76d65896ffba	role list	saml	saml-role-list-mapper	\N	52d8e236-5515-4590-9f33-a6a3c96a3395
c7423204-71ac-4e18-ac0e-dac6599a7c7b	full name	openid-connect	oidc-full-name-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
f1edb40b-a8da-41db-861e-475ce10c7224	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
4027f562-5afa-4ce0-ba2c-e698a7de5877	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
b5af617f-3987-4c74-8001-67c329051c15	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
b2915916-4fbb-46e5-91aa-62b6d3cc4f9c	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
957c5d29-0387-4478-8d1e-47b4d74c46ee	username	openid-connect	oidc-usermodel-attribute-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
a1f6ebb4-fea8-44f7-9f10-4ec78f405de7	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
38da2512-fad7-4324-b7d3-58fe72600409	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
8e88dc27-451a-4731-b0c9-4be4f2c6ac5d	website	openid-connect	oidc-usermodel-attribute-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
d5ff3c53-f023-4783-8883-9dc107c0dfdb	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
81cd01ff-30f3-488f-8d9e-8314b5aef03e	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
34678482-66b4-4a40-9ecb-198bf5641f67	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
1ca69718-56f6-4c7a-a8b9-8f9c1b6cb58b	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
1358d401-5090-47c3-a9fb-aa34f3e84e1c	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	fa1609b7-8e09-4b8a-8cba-074a6f174fdc
4298c7bd-0f40-4545-a5b3-2e4ae61ec0ca	email	openid-connect	oidc-usermodel-attribute-mapper	\N	f6a79dc2-3f88-4c24-9cf4-45b9231a04c7
9546396a-96ff-4550-a458-1e9e1034102c	email verified	openid-connect	oidc-usermodel-property-mapper	\N	f6a79dc2-3f88-4c24-9cf4-45b9231a04c7
57a9f733-3f04-4822-8887-5a38e0bd34a2	address	openid-connect	oidc-address-mapper	\N	fc6fbe06-c104-4561-9fe3-74486bb46212
230737b9-d982-4ca9-98db-7e4e11b16d0c	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	80ffea1b-8dd5-4c11-92a9-f8090cc08ab1
afd30ccd-5ba7-4320-999b-b0f22f29f751	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	80ffea1b-8dd5-4c11-92a9-f8090cc08ab1
57e0993a-b16f-4c0c-90b0-7befeab34f86	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	aeb4cff8-2781-4f07-9965-7cce39afb2e2
283744ae-d54c-4592-ab5a-f9ecaa743572	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	aeb4cff8-2781-4f07-9965-7cce39afb2e2
52a66f70-274f-40aa-94c3-e61856a35534	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	aeb4cff8-2781-4f07-9965-7cce39afb2e2
2939c560-afb8-40c9-b433-0ff8c780b9a1	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	bf1fe07f-6faa-432a-aa64-57dbf2bcb443
8434689e-015b-47d0-a026-fdc35fc2fdc6	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	7241ba22-96f1-45ff-8497-ae6343f7cc91
1a0531ac-3dca-48ca-8e58-0b800f3fb08b	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	7241ba22-96f1-45ff-8497-ae6343f7cc91
f26125ce-70a8-4b90-99da-b8a000aa742c	acr loa level	openid-connect	oidc-acr-mapper	\N	7ef9eb96-67cc-4d1c-b4e0-b256d4e90deb
15ae0c95-dfb5-41fc-a059-fd6ad6ca6440	locale	openid-connect	oidc-usermodel-attribute-mapper	c1a4b05c-5a99-4092-9593-2081bc7a1c30	\N
4e916597-fe9c-4345-9e47-c2219f92046f	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	71427592-7de6-4d12-b8bc-f96289726cfd
ec074af9-f8d7-4fe6-a64c-731d98295391	client roles	openid-connect	oidc-usermodel-client-role-mapper	4beaf17c-a463-4896-9314-a4b22bd894b5	\N
b514ccc4-9d7e-40a3-9ecc-4f9624e6782e	audience resolve	openid-connect	oidc-audience-resolve-mapper	35bf4270-3a4c-4caf-9241-b183b0a838fe	\N
cb24d0b0-99d8-4978-b27f-a0f578f889f1	role list	saml	saml-role-list-mapper	\N	7d9df514-e8f6-4e2b-bf99-36e0a2a05610
2bb0275d-b833-4038-8812-ce749e29ab88	full name	openid-connect	oidc-full-name-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
a1d7971c-4a26-4e01-9a41-431f6f0f052f	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
d205979f-c19c-464f-9b73-e8dd351ab565	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
cbe8374c-9570-4701-9d3c-2341b62854fc	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
97b92a73-b265-4cd3-a3bf-805a037c4a43	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
94797e53-eb0f-4ff3-920e-0a66a0750e08	username	openid-connect	oidc-usermodel-attribute-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
3d408755-01f0-43b4-94ec-e0b7052ad894	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
feee3287-b5ed-4718-b8df-87b837f25031	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
371933d6-1685-4ffd-bd38-debbd14e9e4c	website	openid-connect	oidc-usermodel-attribute-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
ef585f6c-a8e0-47bf-8f2f-21d975c33dd0	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
dae5822d-4164-4721-a197-159fe50020b2	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
a53ed964-69fc-4171-8774-3f6a57f55645	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
347f1e6a-75dc-49d6-acd2-363256848d32	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
4a213f45-700c-4d64-8d92-ed111077df9e	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	c0d0b991-495b-4484-bc1f-24edcf8a7fca
31742c93-1488-48ca-a6ac-2f12cd3e0a3e	email	openid-connect	oidc-usermodel-attribute-mapper	\N	03d185fa-0e2a-47af-a2da-cd4b600619b6
f6745f00-eb70-4110-9086-6bab6ace3fa4	email verified	openid-connect	oidc-usermodel-property-mapper	\N	03d185fa-0e2a-47af-a2da-cd4b600619b6
21443738-d334-4d38-9464-5e7a48a07bd0	address	openid-connect	oidc-address-mapper	\N	8e6883b3-ba8d-4ef6-97b2-092673d11aed
09340371-34ee-4de3-b6e8-6f8606731d79	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	120b2b69-b8a2-4380-9cd9-3cb49886a804
29d36701-68ae-47ce-acde-279a284e1a41	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	120b2b69-b8a2-4380-9cd9-3cb49886a804
08d7bf38-f35b-4ad5-b292-fc7fe61f550b	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	ac1492d2-e3bd-4242-affe-f372e109f284
7de1450a-5367-4f95-8719-aa7bac0fe6ef	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	ac1492d2-e3bd-4242-affe-f372e109f284
e84b66d6-86f7-43eb-ba4c-f730516821a2	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	ac1492d2-e3bd-4242-affe-f372e109f284
06f0370f-4098-4f48-8dc9-e18b5f5f0d65	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	57e8e861-c01e-444a-b017-939b46021f12
4fcade81-dd49-466a-a1b7-d71db8ddf370	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	c054c6af-66f1-4a65-b61d-d0ba709be07e
a74061bb-eeff-49ee-9ee4-ecc83af7940d	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	c054c6af-66f1-4a65-b61d-d0ba709be07e
6a31e95c-fec5-43df-b592-f1fa2c126dd9	acr loa level	openid-connect	oidc-acr-mapper	\N	973b4773-66e0-4036-903e-922011f627b9
e09e4fe2-1f42-4ccb-ba82-f128db9c4253	locale	openid-connect	oidc-usermodel-attribute-mapper	12215ae6-3f08-4e58-b662-ff85df0effb1	\N
c68f9fdb-94d6-433e-b7f1-483b60258964	delegatorTypeOfIdentifier	openid-connect	oidc-usermodel-attribute-mapper	\N	f4c6c4b5-b7a6-4bb4-8eb3-3dad37064741
adb48234-82ee-474d-b213-a360991c2f69	delegatorTypeOfActor	openid-connect	oidc-usermodel-attribute-mapper	\N	73014569-6884-40b6-a0bf-83e3560f9ee5
ba0236ff-8669-402a-833a-dea6034bdf24	legalname	openid-connect	oidc-usermodel-attribute-mapper	\N	096c8c1f-dacf-4ec4-a9e2-18dd3ec7445a
29b1a816-4a22-4033-b6f0-58a46635de18	typeOfIdentifier	openid-connect	oidc-usermodel-attribute-mapper	\N	4d2dee30-44e9-47ba-9a61-24911ce5575f
37e71428-d222-4cee-8f36-06c5ef5dcfa6	delegatorLegalname	openid-connect	oidc-usermodel-attribute-mapper	\N	aa02a150-384e-4574-9f0f-844847b2397d
d4b6deb6-ebe5-4fb2-9aa1-6dd86a06649f	delegatorAlternateIdentifierType	openid-connect	oidc-usermodel-attribute-mapper	\N	6f886051-b217-4e14-9f52-7a7b30e2f47e
dffebb51-fb7c-48b2-9ae5-3f1599262c92	delegatorTypeOfPerson	openid-connect	oidc-usermodel-attribute-mapper	\N	196b6d76-880c-43b7-99c4-7e171a4177bf
5e8ac855-334c-4e83-84e1-d7e933c75c96	delegatorAlternateName	openid-connect	oidc-usermodel-attribute-mapper	\N	9d05b36e-dd7c-4980-b974-834f78aae1f9
d756868f-1f57-45a1-ad1c-45b238c5e92c	delegatorAlternateIdentifier	openid-connect	oidc-usermodel-attribute-mapper	\N	00bf4cec-949b-4725-9277-0e64219a6ffc
c611ec10-aaf1-442a-be99-a83633332e59	countryCode	openid-connect	oidc-usermodel-attribute-mapper	\N	6b5ae4d9-135f-4c09-875e-a9314338f847
bbc0dafa-8989-4f3c-8fc0-37eca928ad47	delegatorIdentifier	openid-connect	oidc-usermodel-attribute-mapper	\N	ec15f768-3f29-4ec3-9030-62dfcb9491e3
cfd9fbae-7044-41e7-8cde-13833fabd55f	typeOfActor	openid-connect	oidc-usermodel-attribute-mapper	\N	f00cc02d-3685-4a80-ab60-807977e25269
fa32ce4e-0c41-4209-a15e-55d8fc35fafa	eIdentifier	openid-connect	oidc-usermodel-attribute-mapper	\N	e203eb9b-87ef-41f3-bb70-6cf0519cf09a
178b0d1c-8d5f-4c82-a601-c1314cbc8d58	delegatorCountryCode	openid-connect	oidc-usermodel-attribute-mapper	\N	ca9ecc5b-1a1e-4431-9835-9612e24a660f
f99a6077-cb1c-4088-9059-85781b0b911d	typeOfPerson	openid-connect	oidc-usermodel-property-mapper	\N	d63dac92-75f1-45ce-8df5-85b25ca56e84
9bf0b0de-0bf7-4a47-a01d-555b85d4c6e6	audience resolve	openid-connect	oidc-audience-resolve-mapper	748c182c-60f3-47cd-bcad-e836a4ae5090	\N
3a80ea83-adce-420e-9d43-f6843c234f64	role list	saml	saml-role-list-mapper	\N	a882fa49-d884-4231-8b49-2cb54d8b4b3c
86d7be4b-984e-4b85-a918-d196c0cf3143	full name	openid-connect	oidc-full-name-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
254bf3aa-2805-4659-9b18-ccdfde876dbe	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
86e82769-2c3d-4916-a7f2-1846a15f0063	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
2f518b70-d892-446f-ba6d-bd9f485d607f	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
aa155166-3cdb-4766-9578-52121570d9da	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
9773cc8b-1921-4331-8153-06e8164b7956	username	openid-connect	oidc-usermodel-attribute-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
54141af5-1950-4cdb-a9ac-017be26eb0a7	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
046e451a-99bd-4822-a802-317f8645c018	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
b44c57e6-1eac-4c64-8c32-664f53c727c3	website	openid-connect	oidc-usermodel-attribute-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
508f3b6e-ad06-4be9-a7ca-c8b488da5c34	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
1d313f8d-551c-4e74-b44f-7229c9afc3f0	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
904433f3-ade4-4f34-981c-d7863336c563	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
419f808e-a0f0-4e8b-8ea2-570a7a644099	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
d558bc25-4154-415d-a1fe-84d23c64d90e	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	8eb116e9-672d-4906-af77-9d4005fb7bc9
53e918fc-0c06-4de5-8d68-de431fd8971c	email	openid-connect	oidc-usermodel-attribute-mapper	\N	3e197c3e-4383-4fda-bdd7-51c57f4cb087
9b1501ce-ae19-49cb-94a6-d7a3d5872746	email verified	openid-connect	oidc-usermodel-property-mapper	\N	3e197c3e-4383-4fda-bdd7-51c57f4cb087
e472b2fe-82d8-45a3-80e3-bc0410c236fe	address	openid-connect	oidc-address-mapper	\N	1cdc4b9f-a3ce-456d-9290-d014bcb95ff5
c7bbd925-5f6c-46c3-9dbc-0998825749f3	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	90db1804-b170-4b99-be1d-64a8a40514a2
e63221b0-7f14-48ed-b4da-3535d2e8f6ad	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	90db1804-b170-4b99-be1d-64a8a40514a2
8854f3be-1179-41e4-93d1-f2b048560cda	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac
9a616c7d-e066-44f5-bbb3-d1c5124b2524	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac
3f5f358c-aeb3-4322-8870-fbc2d930ab85	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	0bf64a6c-98fe-4dbd-a7b3-c8eb3c1b75ac
0459a327-8bf8-4d22-b751-07766703b69d	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	6f3f9fbd-2705-4c4b-adb2-36d92a7f19fd
87f7ff8b-628d-4d36-b17a-d087b541445c	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	f7a19d3c-7e9c-4b6c-b123-aa14d4581a24
60517bff-3ed5-47d1-91cb-e99e3be0cd3e	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	f7a19d3c-7e9c-4b6c-b123-aa14d4581a24
d26d7ed4-cb1d-4008-ab27-f72c722bb038	acr loa level	openid-connect	oidc-acr-mapper	\N	a1ed248a-e826-4058-9919-32a365698eb2
fa81948f-663b-45ec-add2-cebb9e1c8191	locale	openid-connect	oidc-usermodel-attribute-mapper	b5858d86-6a83-43ba-a4b0-a0dd5e663059	\N
b153d929-1b52-417f-b0b2-3b23488c1ba9	skatMedarbejderADAfdelingKontor	openid-connect	oidc-usermodel-attribute-mapper	\N	c0f52a89-0999-433f-812c-f924e13dfde2
b15735bf-c5cc-4706-ac2d-636b24e849e1	skatMedarbejderADNummer	openid-connect	oidc-usermodel-attribute-mapper	\N	6e7c245c-a1ba-4a52-a6ce-52626366650f
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
5e9e6098-89d7-4775-b3f0-b0c3ad67bad0	true	userinfo.token.claim
5e9e6098-89d7-4775-b3f0-b0c3ad67bad0	locale	user.attribute
5e9e6098-89d7-4775-b3f0-b0c3ad67bad0	true	id.token.claim
5e9e6098-89d7-4775-b3f0-b0c3ad67bad0	true	access.token.claim
5e9e6098-89d7-4775-b3f0-b0c3ad67bad0	locale	claim.name
5e9e6098-89d7-4775-b3f0-b0c3ad67bad0	String	jsonType.label
173b2cf5-a1f6-40a6-a1eb-1d40ed244b79	false	single
173b2cf5-a1f6-40a6-a1eb-1d40ed244b79	Basic	attribute.nameformat
173b2cf5-a1f6-40a6-a1eb-1d40ed244b79	Role	attribute.name
1c386642-740e-4cbc-a9a4-7981ee046320	true	userinfo.token.claim
1c386642-740e-4cbc-a9a4-7981ee046320	middleName	user.attribute
1c386642-740e-4cbc-a9a4-7981ee046320	true	id.token.claim
1c386642-740e-4cbc-a9a4-7981ee046320	true	access.token.claim
1c386642-740e-4cbc-a9a4-7981ee046320	middle_name	claim.name
1c386642-740e-4cbc-a9a4-7981ee046320	String	jsonType.label
1f297e6b-88cc-476b-9711-f226cab4e104	true	userinfo.token.claim
1f297e6b-88cc-476b-9711-f226cab4e104	firstName	user.attribute
1f297e6b-88cc-476b-9711-f226cab4e104	true	id.token.claim
1f297e6b-88cc-476b-9711-f226cab4e104	true	access.token.claim
1f297e6b-88cc-476b-9711-f226cab4e104	given_name	claim.name
1f297e6b-88cc-476b-9711-f226cab4e104	String	jsonType.label
229e6963-4caf-43c5-a37c-0bfd40c0cb76	true	userinfo.token.claim
229e6963-4caf-43c5-a37c-0bfd40c0cb76	gender	user.attribute
229e6963-4caf-43c5-a37c-0bfd40c0cb76	true	id.token.claim
229e6963-4caf-43c5-a37c-0bfd40c0cb76	true	access.token.claim
229e6963-4caf-43c5-a37c-0bfd40c0cb76	gender	claim.name
229e6963-4caf-43c5-a37c-0bfd40c0cb76	String	jsonType.label
587a158d-dcfa-4425-a3f5-dc86f74f8f1a	true	userinfo.token.claim
587a158d-dcfa-4425-a3f5-dc86f74f8f1a	nickname	user.attribute
587a158d-dcfa-4425-a3f5-dc86f74f8f1a	true	id.token.claim
587a158d-dcfa-4425-a3f5-dc86f74f8f1a	true	access.token.claim
587a158d-dcfa-4425-a3f5-dc86f74f8f1a	nickname	claim.name
587a158d-dcfa-4425-a3f5-dc86f74f8f1a	String	jsonType.label
6018cd09-bad9-44a2-8ced-8b42b3fdf8ff	true	userinfo.token.claim
6018cd09-bad9-44a2-8ced-8b42b3fdf8ff	username	user.attribute
6018cd09-bad9-44a2-8ced-8b42b3fdf8ff	true	id.token.claim
6018cd09-bad9-44a2-8ced-8b42b3fdf8ff	true	access.token.claim
6018cd09-bad9-44a2-8ced-8b42b3fdf8ff	preferred_username	claim.name
6018cd09-bad9-44a2-8ced-8b42b3fdf8ff	String	jsonType.label
6551ef87-1b7a-4d63-8002-dbf3ae40236b	true	userinfo.token.claim
6551ef87-1b7a-4d63-8002-dbf3ae40236b	zoneinfo	user.attribute
6551ef87-1b7a-4d63-8002-dbf3ae40236b	true	id.token.claim
6551ef87-1b7a-4d63-8002-dbf3ae40236b	true	access.token.claim
6551ef87-1b7a-4d63-8002-dbf3ae40236b	zoneinfo	claim.name
6551ef87-1b7a-4d63-8002-dbf3ae40236b	String	jsonType.label
78918ed1-8a03-4c04-96d2-8fbff0ec3bd8	true	userinfo.token.claim
78918ed1-8a03-4c04-96d2-8fbff0ec3bd8	website	user.attribute
78918ed1-8a03-4c04-96d2-8fbff0ec3bd8	true	id.token.claim
78918ed1-8a03-4c04-96d2-8fbff0ec3bd8	true	access.token.claim
78918ed1-8a03-4c04-96d2-8fbff0ec3bd8	website	claim.name
78918ed1-8a03-4c04-96d2-8fbff0ec3bd8	String	jsonType.label
884df239-a01f-4ed1-b2e5-f53104a0726b	true	userinfo.token.claim
884df239-a01f-4ed1-b2e5-f53104a0726b	lastName	user.attribute
884df239-a01f-4ed1-b2e5-f53104a0726b	true	id.token.claim
884df239-a01f-4ed1-b2e5-f53104a0726b	true	access.token.claim
884df239-a01f-4ed1-b2e5-f53104a0726b	family_name	claim.name
884df239-a01f-4ed1-b2e5-f53104a0726b	String	jsonType.label
9a86b7bd-a941-4bc7-b0b4-cf1fa1c86e74	true	userinfo.token.claim
9a86b7bd-a941-4bc7-b0b4-cf1fa1c86e74	locale	user.attribute
9a86b7bd-a941-4bc7-b0b4-cf1fa1c86e74	true	id.token.claim
9a86b7bd-a941-4bc7-b0b4-cf1fa1c86e74	true	access.token.claim
9a86b7bd-a941-4bc7-b0b4-cf1fa1c86e74	locale	claim.name
9a86b7bd-a941-4bc7-b0b4-cf1fa1c86e74	String	jsonType.label
ae6ebded-9aa0-4c4a-b179-30e9c63942b8	true	userinfo.token.claim
ae6ebded-9aa0-4c4a-b179-30e9c63942b8	birthdate	user.attribute
ae6ebded-9aa0-4c4a-b179-30e9c63942b8	true	id.token.claim
ae6ebded-9aa0-4c4a-b179-30e9c63942b8	true	access.token.claim
ae6ebded-9aa0-4c4a-b179-30e9c63942b8	birthdate	claim.name
ae6ebded-9aa0-4c4a-b179-30e9c63942b8	String	jsonType.label
b02e496b-fb56-4cf6-9c77-6ecb4c2d3fdf	true	userinfo.token.claim
b02e496b-fb56-4cf6-9c77-6ecb4c2d3fdf	picture	user.attribute
b02e496b-fb56-4cf6-9c77-6ecb4c2d3fdf	true	id.token.claim
b02e496b-fb56-4cf6-9c77-6ecb4c2d3fdf	true	access.token.claim
b02e496b-fb56-4cf6-9c77-6ecb4c2d3fdf	picture	claim.name
b02e496b-fb56-4cf6-9c77-6ecb4c2d3fdf	String	jsonType.label
b11b21f4-a746-4e1c-a598-c503bca2249a	true	userinfo.token.claim
b11b21f4-a746-4e1c-a598-c503bca2249a	profile	user.attribute
b11b21f4-a746-4e1c-a598-c503bca2249a	true	id.token.claim
b11b21f4-a746-4e1c-a598-c503bca2249a	true	access.token.claim
b11b21f4-a746-4e1c-a598-c503bca2249a	profile	claim.name
b11b21f4-a746-4e1c-a598-c503bca2249a	String	jsonType.label
da7981e6-0480-4086-941a-ca6b1bc9477a	true	userinfo.token.claim
da7981e6-0480-4086-941a-ca6b1bc9477a	updatedAt	user.attribute
da7981e6-0480-4086-941a-ca6b1bc9477a	true	id.token.claim
da7981e6-0480-4086-941a-ca6b1bc9477a	true	access.token.claim
da7981e6-0480-4086-941a-ca6b1bc9477a	updated_at	claim.name
da7981e6-0480-4086-941a-ca6b1bc9477a	long	jsonType.label
e4b8a370-ec29-4751-b1bd-5f922b4887c4	true	userinfo.token.claim
e4b8a370-ec29-4751-b1bd-5f922b4887c4	true	id.token.claim
e4b8a370-ec29-4751-b1bd-5f922b4887c4	true	access.token.claim
47c10257-f559-4c84-a26c-ada0f04bc2f0	true	userinfo.token.claim
47c10257-f559-4c84-a26c-ada0f04bc2f0	email	user.attribute
47c10257-f559-4c84-a26c-ada0f04bc2f0	true	id.token.claim
47c10257-f559-4c84-a26c-ada0f04bc2f0	true	access.token.claim
47c10257-f559-4c84-a26c-ada0f04bc2f0	email	claim.name
47c10257-f559-4c84-a26c-ada0f04bc2f0	String	jsonType.label
6901064a-71a0-4a24-8209-b78431f1665e	true	userinfo.token.claim
6901064a-71a0-4a24-8209-b78431f1665e	emailVerified	user.attribute
6901064a-71a0-4a24-8209-b78431f1665e	true	id.token.claim
6901064a-71a0-4a24-8209-b78431f1665e	true	access.token.claim
6901064a-71a0-4a24-8209-b78431f1665e	email_verified	claim.name
6901064a-71a0-4a24-8209-b78431f1665e	boolean	jsonType.label
e9e4ffec-3b23-4628-ac0e-e853c1cdd357	formatted	user.attribute.formatted
e9e4ffec-3b23-4628-ac0e-e853c1cdd357	country	user.attribute.country
e9e4ffec-3b23-4628-ac0e-e853c1cdd357	postal_code	user.attribute.postal_code
e9e4ffec-3b23-4628-ac0e-e853c1cdd357	true	userinfo.token.claim
e9e4ffec-3b23-4628-ac0e-e853c1cdd357	street	user.attribute.street
e9e4ffec-3b23-4628-ac0e-e853c1cdd357	true	id.token.claim
e9e4ffec-3b23-4628-ac0e-e853c1cdd357	region	user.attribute.region
e9e4ffec-3b23-4628-ac0e-e853c1cdd357	true	access.token.claim
e9e4ffec-3b23-4628-ac0e-e853c1cdd357	locality	user.attribute.locality
580bd027-0773-444b-b47e-a3d4e67a0caf	true	userinfo.token.claim
580bd027-0773-444b-b47e-a3d4e67a0caf	phoneNumber	user.attribute
580bd027-0773-444b-b47e-a3d4e67a0caf	true	id.token.claim
580bd027-0773-444b-b47e-a3d4e67a0caf	true	access.token.claim
580bd027-0773-444b-b47e-a3d4e67a0caf	phone_number	claim.name
580bd027-0773-444b-b47e-a3d4e67a0caf	String	jsonType.label
dc6a236c-a0da-4d50-ad81-e626c4440f47	true	userinfo.token.claim
dc6a236c-a0da-4d50-ad81-e626c4440f47	phoneNumberVerified	user.attribute
dc6a236c-a0da-4d50-ad81-e626c4440f47	true	id.token.claim
dc6a236c-a0da-4d50-ad81-e626c4440f47	true	access.token.claim
dc6a236c-a0da-4d50-ad81-e626c4440f47	phone_number_verified	claim.name
dc6a236c-a0da-4d50-ad81-e626c4440f47	boolean	jsonType.label
02d1d3bb-f700-4ad0-b70f-14ac24d75899	true	multivalued
02d1d3bb-f700-4ad0-b70f-14ac24d75899	foo	user.attribute
02d1d3bb-f700-4ad0-b70f-14ac24d75899	true	access.token.claim
02d1d3bb-f700-4ad0-b70f-14ac24d75899	realm_access.roles	claim.name
02d1d3bb-f700-4ad0-b70f-14ac24d75899	String	jsonType.label
31ec7994-396b-4ac4-9ebd-157ad9d3082a	true	multivalued
31ec7994-396b-4ac4-9ebd-157ad9d3082a	foo	user.attribute
31ec7994-396b-4ac4-9ebd-157ad9d3082a	true	access.token.claim
31ec7994-396b-4ac4-9ebd-157ad9d3082a	resource_access.${client_id}.roles	claim.name
31ec7994-396b-4ac4-9ebd-157ad9d3082a	String	jsonType.label
c0a7e00e-4157-432c-b82f-fb5b6ecf8eb7	true	userinfo.token.claim
c0a7e00e-4157-432c-b82f-fb5b6ecf8eb7	username	user.attribute
c0a7e00e-4157-432c-b82f-fb5b6ecf8eb7	true	id.token.claim
c0a7e00e-4157-432c-b82f-fb5b6ecf8eb7	true	access.token.claim
c0a7e00e-4157-432c-b82f-fb5b6ecf8eb7	upn	claim.name
c0a7e00e-4157-432c-b82f-fb5b6ecf8eb7	String	jsonType.label
dd40fed0-63ae-4bf6-91b5-f56f1bfa1b7a	true	multivalued
dd40fed0-63ae-4bf6-91b5-f56f1bfa1b7a	foo	user.attribute
dd40fed0-63ae-4bf6-91b5-f56f1bfa1b7a	true	id.token.claim
dd40fed0-63ae-4bf6-91b5-f56f1bfa1b7a	true	access.token.claim
dd40fed0-63ae-4bf6-91b5-f56f1bfa1b7a	groups	claim.name
dd40fed0-63ae-4bf6-91b5-f56f1bfa1b7a	String	jsonType.label
ccd18825-5d9b-435e-8cdb-82ec85f5340e	true	id.token.claim
ccd18825-5d9b-435e-8cdb-82ec85f5340e	true	access.token.claim
b57ca5c4-52d1-4819-9a17-76d65896ffba	false	single
b57ca5c4-52d1-4819-9a17-76d65896ffba	Basic	attribute.nameformat
b57ca5c4-52d1-4819-9a17-76d65896ffba	Role	attribute.name
1358d401-5090-47c3-a9fb-aa34f3e84e1c	true	userinfo.token.claim
1358d401-5090-47c3-a9fb-aa34f3e84e1c	updatedAt	user.attribute
1358d401-5090-47c3-a9fb-aa34f3e84e1c	true	id.token.claim
1358d401-5090-47c3-a9fb-aa34f3e84e1c	true	access.token.claim
1358d401-5090-47c3-a9fb-aa34f3e84e1c	updated_at	claim.name
1358d401-5090-47c3-a9fb-aa34f3e84e1c	long	jsonType.label
1ca69718-56f6-4c7a-a8b9-8f9c1b6cb58b	true	userinfo.token.claim
1ca69718-56f6-4c7a-a8b9-8f9c1b6cb58b	locale	user.attribute
1ca69718-56f6-4c7a-a8b9-8f9c1b6cb58b	true	id.token.claim
1ca69718-56f6-4c7a-a8b9-8f9c1b6cb58b	true	access.token.claim
1ca69718-56f6-4c7a-a8b9-8f9c1b6cb58b	locale	claim.name
1ca69718-56f6-4c7a-a8b9-8f9c1b6cb58b	String	jsonType.label
34678482-66b4-4a40-9ecb-198bf5641f67	true	userinfo.token.claim
34678482-66b4-4a40-9ecb-198bf5641f67	zoneinfo	user.attribute
34678482-66b4-4a40-9ecb-198bf5641f67	true	id.token.claim
34678482-66b4-4a40-9ecb-198bf5641f67	true	access.token.claim
34678482-66b4-4a40-9ecb-198bf5641f67	zoneinfo	claim.name
34678482-66b4-4a40-9ecb-198bf5641f67	String	jsonType.label
38da2512-fad7-4324-b7d3-58fe72600409	true	userinfo.token.claim
38da2512-fad7-4324-b7d3-58fe72600409	picture	user.attribute
38da2512-fad7-4324-b7d3-58fe72600409	true	id.token.claim
38da2512-fad7-4324-b7d3-58fe72600409	true	access.token.claim
38da2512-fad7-4324-b7d3-58fe72600409	picture	claim.name
38da2512-fad7-4324-b7d3-58fe72600409	String	jsonType.label
4027f562-5afa-4ce0-ba2c-e698a7de5877	true	userinfo.token.claim
4027f562-5afa-4ce0-ba2c-e698a7de5877	firstName	user.attribute
4027f562-5afa-4ce0-ba2c-e698a7de5877	true	id.token.claim
4027f562-5afa-4ce0-ba2c-e698a7de5877	true	access.token.claim
4027f562-5afa-4ce0-ba2c-e698a7de5877	given_name	claim.name
4027f562-5afa-4ce0-ba2c-e698a7de5877	String	jsonType.label
81cd01ff-30f3-488f-8d9e-8314b5aef03e	true	userinfo.token.claim
81cd01ff-30f3-488f-8d9e-8314b5aef03e	birthdate	user.attribute
81cd01ff-30f3-488f-8d9e-8314b5aef03e	true	id.token.claim
81cd01ff-30f3-488f-8d9e-8314b5aef03e	true	access.token.claim
81cd01ff-30f3-488f-8d9e-8314b5aef03e	birthdate	claim.name
81cd01ff-30f3-488f-8d9e-8314b5aef03e	String	jsonType.label
8e88dc27-451a-4731-b0c9-4be4f2c6ac5d	true	userinfo.token.claim
8e88dc27-451a-4731-b0c9-4be4f2c6ac5d	website	user.attribute
8e88dc27-451a-4731-b0c9-4be4f2c6ac5d	true	id.token.claim
8e88dc27-451a-4731-b0c9-4be4f2c6ac5d	true	access.token.claim
8e88dc27-451a-4731-b0c9-4be4f2c6ac5d	website	claim.name
8e88dc27-451a-4731-b0c9-4be4f2c6ac5d	String	jsonType.label
957c5d29-0387-4478-8d1e-47b4d74c46ee	true	userinfo.token.claim
957c5d29-0387-4478-8d1e-47b4d74c46ee	username	user.attribute
957c5d29-0387-4478-8d1e-47b4d74c46ee	true	id.token.claim
957c5d29-0387-4478-8d1e-47b4d74c46ee	true	access.token.claim
957c5d29-0387-4478-8d1e-47b4d74c46ee	preferred_username	claim.name
957c5d29-0387-4478-8d1e-47b4d74c46ee	String	jsonType.label
a1f6ebb4-fea8-44f7-9f10-4ec78f405de7	true	userinfo.token.claim
a1f6ebb4-fea8-44f7-9f10-4ec78f405de7	profile	user.attribute
a1f6ebb4-fea8-44f7-9f10-4ec78f405de7	true	id.token.claim
a1f6ebb4-fea8-44f7-9f10-4ec78f405de7	true	access.token.claim
a1f6ebb4-fea8-44f7-9f10-4ec78f405de7	profile	claim.name
a1f6ebb4-fea8-44f7-9f10-4ec78f405de7	String	jsonType.label
b2915916-4fbb-46e5-91aa-62b6d3cc4f9c	true	userinfo.token.claim
b2915916-4fbb-46e5-91aa-62b6d3cc4f9c	nickname	user.attribute
b2915916-4fbb-46e5-91aa-62b6d3cc4f9c	true	id.token.claim
b2915916-4fbb-46e5-91aa-62b6d3cc4f9c	true	access.token.claim
b2915916-4fbb-46e5-91aa-62b6d3cc4f9c	nickname	claim.name
b2915916-4fbb-46e5-91aa-62b6d3cc4f9c	String	jsonType.label
b5af617f-3987-4c74-8001-67c329051c15	true	userinfo.token.claim
b5af617f-3987-4c74-8001-67c329051c15	middleName	user.attribute
b5af617f-3987-4c74-8001-67c329051c15	true	id.token.claim
b5af617f-3987-4c74-8001-67c329051c15	true	access.token.claim
b5af617f-3987-4c74-8001-67c329051c15	middle_name	claim.name
b5af617f-3987-4c74-8001-67c329051c15	String	jsonType.label
c7423204-71ac-4e18-ac0e-dac6599a7c7b	true	userinfo.token.claim
c7423204-71ac-4e18-ac0e-dac6599a7c7b	true	id.token.claim
c7423204-71ac-4e18-ac0e-dac6599a7c7b	true	access.token.claim
d5ff3c53-f023-4783-8883-9dc107c0dfdb	true	userinfo.token.claim
d5ff3c53-f023-4783-8883-9dc107c0dfdb	gender	user.attribute
d5ff3c53-f023-4783-8883-9dc107c0dfdb	true	id.token.claim
d5ff3c53-f023-4783-8883-9dc107c0dfdb	true	access.token.claim
d5ff3c53-f023-4783-8883-9dc107c0dfdb	gender	claim.name
d5ff3c53-f023-4783-8883-9dc107c0dfdb	String	jsonType.label
f1edb40b-a8da-41db-861e-475ce10c7224	true	userinfo.token.claim
f1edb40b-a8da-41db-861e-475ce10c7224	lastName	user.attribute
f1edb40b-a8da-41db-861e-475ce10c7224	true	id.token.claim
f1edb40b-a8da-41db-861e-475ce10c7224	true	access.token.claim
f1edb40b-a8da-41db-861e-475ce10c7224	family_name	claim.name
f1edb40b-a8da-41db-861e-475ce10c7224	String	jsonType.label
4298c7bd-0f40-4545-a5b3-2e4ae61ec0ca	true	userinfo.token.claim
4298c7bd-0f40-4545-a5b3-2e4ae61ec0ca	email	user.attribute
4298c7bd-0f40-4545-a5b3-2e4ae61ec0ca	true	id.token.claim
4298c7bd-0f40-4545-a5b3-2e4ae61ec0ca	true	access.token.claim
4298c7bd-0f40-4545-a5b3-2e4ae61ec0ca	email	claim.name
4298c7bd-0f40-4545-a5b3-2e4ae61ec0ca	String	jsonType.label
9546396a-96ff-4550-a458-1e9e1034102c	true	userinfo.token.claim
9546396a-96ff-4550-a458-1e9e1034102c	emailVerified	user.attribute
9546396a-96ff-4550-a458-1e9e1034102c	true	id.token.claim
9546396a-96ff-4550-a458-1e9e1034102c	true	access.token.claim
9546396a-96ff-4550-a458-1e9e1034102c	email_verified	claim.name
9546396a-96ff-4550-a458-1e9e1034102c	boolean	jsonType.label
57a9f733-3f04-4822-8887-5a38e0bd34a2	formatted	user.attribute.formatted
57a9f733-3f04-4822-8887-5a38e0bd34a2	country	user.attribute.country
57a9f733-3f04-4822-8887-5a38e0bd34a2	postal_code	user.attribute.postal_code
57a9f733-3f04-4822-8887-5a38e0bd34a2	true	userinfo.token.claim
57a9f733-3f04-4822-8887-5a38e0bd34a2	street	user.attribute.street
57a9f733-3f04-4822-8887-5a38e0bd34a2	true	id.token.claim
57a9f733-3f04-4822-8887-5a38e0bd34a2	region	user.attribute.region
57a9f733-3f04-4822-8887-5a38e0bd34a2	true	access.token.claim
57a9f733-3f04-4822-8887-5a38e0bd34a2	locality	user.attribute.locality
230737b9-d982-4ca9-98db-7e4e11b16d0c	true	userinfo.token.claim
230737b9-d982-4ca9-98db-7e4e11b16d0c	phoneNumber	user.attribute
230737b9-d982-4ca9-98db-7e4e11b16d0c	true	id.token.claim
230737b9-d982-4ca9-98db-7e4e11b16d0c	true	access.token.claim
230737b9-d982-4ca9-98db-7e4e11b16d0c	phone_number	claim.name
230737b9-d982-4ca9-98db-7e4e11b16d0c	String	jsonType.label
afd30ccd-5ba7-4320-999b-b0f22f29f751	true	userinfo.token.claim
afd30ccd-5ba7-4320-999b-b0f22f29f751	phoneNumberVerified	user.attribute
afd30ccd-5ba7-4320-999b-b0f22f29f751	true	id.token.claim
afd30ccd-5ba7-4320-999b-b0f22f29f751	true	access.token.claim
afd30ccd-5ba7-4320-999b-b0f22f29f751	phone_number_verified	claim.name
afd30ccd-5ba7-4320-999b-b0f22f29f751	boolean	jsonType.label
283744ae-d54c-4592-ab5a-f9ecaa743572	true	multivalued
283744ae-d54c-4592-ab5a-f9ecaa743572	foo	user.attribute
283744ae-d54c-4592-ab5a-f9ecaa743572	true	access.token.claim
283744ae-d54c-4592-ab5a-f9ecaa743572	resource_access.${client_id}.roles	claim.name
283744ae-d54c-4592-ab5a-f9ecaa743572	String	jsonType.label
57e0993a-b16f-4c0c-90b0-7befeab34f86	true	multivalued
57e0993a-b16f-4c0c-90b0-7befeab34f86	foo	user.attribute
57e0993a-b16f-4c0c-90b0-7befeab34f86	true	access.token.claim
57e0993a-b16f-4c0c-90b0-7befeab34f86	realm_access.roles	claim.name
57e0993a-b16f-4c0c-90b0-7befeab34f86	String	jsonType.label
1a0531ac-3dca-48ca-8e58-0b800f3fb08b	true	multivalued
1a0531ac-3dca-48ca-8e58-0b800f3fb08b	foo	user.attribute
1a0531ac-3dca-48ca-8e58-0b800f3fb08b	true	id.token.claim
1a0531ac-3dca-48ca-8e58-0b800f3fb08b	true	access.token.claim
1a0531ac-3dca-48ca-8e58-0b800f3fb08b	groups	claim.name
1a0531ac-3dca-48ca-8e58-0b800f3fb08b	String	jsonType.label
8434689e-015b-47d0-a026-fdc35fc2fdc6	true	userinfo.token.claim
8434689e-015b-47d0-a026-fdc35fc2fdc6	username	user.attribute
8434689e-015b-47d0-a026-fdc35fc2fdc6	true	id.token.claim
8434689e-015b-47d0-a026-fdc35fc2fdc6	true	access.token.claim
8434689e-015b-47d0-a026-fdc35fc2fdc6	upn	claim.name
8434689e-015b-47d0-a026-fdc35fc2fdc6	String	jsonType.label
f26125ce-70a8-4b90-99da-b8a000aa742c	true	id.token.claim
f26125ce-70a8-4b90-99da-b8a000aa742c	true	access.token.claim
15ae0c95-dfb5-41fc-a059-fd6ad6ca6440	true	userinfo.token.claim
15ae0c95-dfb5-41fc-a059-fd6ad6ca6440	locale	user.attribute
15ae0c95-dfb5-41fc-a059-fd6ad6ca6440	true	id.token.claim
15ae0c95-dfb5-41fc-a059-fd6ad6ca6440	true	access.token.claim
15ae0c95-dfb5-41fc-a059-fd6ad6ca6440	locale	claim.name
15ae0c95-dfb5-41fc-a059-fd6ad6ca6440	String	jsonType.label
4e916597-fe9c-4345-9e47-c2219f92046f	foo	user.attribute
4e916597-fe9c-4345-9e47-c2219f92046f	true	access.token.claim
4e916597-fe9c-4345-9e47-c2219f92046f	resource_access.${client_id}.roles	claim.name
4e916597-fe9c-4345-9e47-c2219f92046f	String	jsonType.label
4e916597-fe9c-4345-9e47-c2219f92046f	true	multivalued
ec074af9-f8d7-4fe6-a64c-731d98295391	foo	user.attribute
ec074af9-f8d7-4fe6-a64c-731d98295391	true	access.token.claim
ec074af9-f8d7-4fe6-a64c-731d98295391	resource_access.${client_id}.roles	claim.name
ec074af9-f8d7-4fe6-a64c-731d98295391	String	jsonType.label
ec074af9-f8d7-4fe6-a64c-731d98295391	true	multivalued
c68f9fdb-94d6-433e-b7f1-483b60258964	true	userinfo.token.claim
c68f9fdb-94d6-433e-b7f1-483b60258964	delegatorTypeOfIdentifier	user.attribute
c68f9fdb-94d6-433e-b7f1-483b60258964	true	id.token.claim
c68f9fdb-94d6-433e-b7f1-483b60258964	true	access.token.claim
c68f9fdb-94d6-433e-b7f1-483b60258964	String	jsonType.label
c68f9fdb-94d6-433e-b7f1-483b60258964	false	aggregate.attrs
c68f9fdb-94d6-433e-b7f1-483b60258964	false	multivalued
3a80ea83-adce-420e-9d43-f6843c234f64	false	single
3a80ea83-adce-420e-9d43-f6843c234f64	Basic	attribute.nameformat
3a80ea83-adce-420e-9d43-f6843c234f64	Role	attribute.name
046e451a-99bd-4822-a802-317f8645c018	true	userinfo.token.claim
046e451a-99bd-4822-a802-317f8645c018	picture	user.attribute
046e451a-99bd-4822-a802-317f8645c018	true	id.token.claim
046e451a-99bd-4822-a802-317f8645c018	true	access.token.claim
046e451a-99bd-4822-a802-317f8645c018	picture	claim.name
046e451a-99bd-4822-a802-317f8645c018	String	jsonType.label
1d313f8d-551c-4e74-b44f-7229c9afc3f0	true	userinfo.token.claim
1d313f8d-551c-4e74-b44f-7229c9afc3f0	birthdate	user.attribute
1d313f8d-551c-4e74-b44f-7229c9afc3f0	true	id.token.claim
1d313f8d-551c-4e74-b44f-7229c9afc3f0	true	access.token.claim
1d313f8d-551c-4e74-b44f-7229c9afc3f0	birthdate	claim.name
1d313f8d-551c-4e74-b44f-7229c9afc3f0	String	jsonType.label
254bf3aa-2805-4659-9b18-ccdfde876dbe	true	userinfo.token.claim
254bf3aa-2805-4659-9b18-ccdfde876dbe	lastName	user.attribute
254bf3aa-2805-4659-9b18-ccdfde876dbe	true	id.token.claim
254bf3aa-2805-4659-9b18-ccdfde876dbe	true	access.token.claim
254bf3aa-2805-4659-9b18-ccdfde876dbe	family_name	claim.name
254bf3aa-2805-4659-9b18-ccdfde876dbe	String	jsonType.label
2f518b70-d892-446f-ba6d-bd9f485d607f	true	userinfo.token.claim
2f518b70-d892-446f-ba6d-bd9f485d607f	middleName	user.attribute
2f518b70-d892-446f-ba6d-bd9f485d607f	true	id.token.claim
2f518b70-d892-446f-ba6d-bd9f485d607f	true	access.token.claim
2f518b70-d892-446f-ba6d-bd9f485d607f	middle_name	claim.name
2f518b70-d892-446f-ba6d-bd9f485d607f	String	jsonType.label
419f808e-a0f0-4e8b-8ea2-570a7a644099	true	userinfo.token.claim
419f808e-a0f0-4e8b-8ea2-570a7a644099	locale	user.attribute
419f808e-a0f0-4e8b-8ea2-570a7a644099	true	id.token.claim
419f808e-a0f0-4e8b-8ea2-570a7a644099	true	access.token.claim
419f808e-a0f0-4e8b-8ea2-570a7a644099	locale	claim.name
419f808e-a0f0-4e8b-8ea2-570a7a644099	String	jsonType.label
508f3b6e-ad06-4be9-a7ca-c8b488da5c34	true	userinfo.token.claim
508f3b6e-ad06-4be9-a7ca-c8b488da5c34	gender	user.attribute
508f3b6e-ad06-4be9-a7ca-c8b488da5c34	true	id.token.claim
508f3b6e-ad06-4be9-a7ca-c8b488da5c34	true	access.token.claim
508f3b6e-ad06-4be9-a7ca-c8b488da5c34	gender	claim.name
c68f9fdb-94d6-433e-b7f1-483b60258964	delegatorTypeOfIdentifier	claim.name
adb48234-82ee-474d-b213-a360991c2f69	true	userinfo.token.claim
adb48234-82ee-474d-b213-a360991c2f69	delegatorTypeOfActor	user.attribute
adb48234-82ee-474d-b213-a360991c2f69	true	id.token.claim
adb48234-82ee-474d-b213-a360991c2f69	true	access.token.claim
adb48234-82ee-474d-b213-a360991c2f69	delegatorTypeOfActor	claim.name
adb48234-82ee-474d-b213-a360991c2f69	String	jsonType.label
ba0236ff-8669-402a-833a-dea6034bdf24	true	userinfo.token.claim
ba0236ff-8669-402a-833a-dea6034bdf24	legalname	user.attribute
ba0236ff-8669-402a-833a-dea6034bdf24	true	id.token.claim
ba0236ff-8669-402a-833a-dea6034bdf24	true	access.token.claim
ba0236ff-8669-402a-833a-dea6034bdf24	legalname	claim.name
ba0236ff-8669-402a-833a-dea6034bdf24	String	jsonType.label
29b1a816-4a22-4033-b6f0-58a46635de18	true	userinfo.token.claim
29b1a816-4a22-4033-b6f0-58a46635de18	typeOfIdentifier	user.attribute
29b1a816-4a22-4033-b6f0-58a46635de18	true	id.token.claim
29b1a816-4a22-4033-b6f0-58a46635de18	true	access.token.claim
29b1a816-4a22-4033-b6f0-58a46635de18	typeOfIdentifier	claim.name
29b1a816-4a22-4033-b6f0-58a46635de18	String	jsonType.label
37e71428-d222-4cee-8f36-06c5ef5dcfa6	true	userinfo.token.claim
37e71428-d222-4cee-8f36-06c5ef5dcfa6	delegatorLegalname	user.attribute
37e71428-d222-4cee-8f36-06c5ef5dcfa6	true	id.token.claim
37e71428-d222-4cee-8f36-06c5ef5dcfa6	true	access.token.claim
37e71428-d222-4cee-8f36-06c5ef5dcfa6	delegatorLegalname	claim.name
37e71428-d222-4cee-8f36-06c5ef5dcfa6	String	jsonType.label
d4b6deb6-ebe5-4fb2-9aa1-6dd86a06649f	true	userinfo.token.claim
d4b6deb6-ebe5-4fb2-9aa1-6dd86a06649f	delegatorAlternateIdentifierType	user.attribute
d4b6deb6-ebe5-4fb2-9aa1-6dd86a06649f	true	id.token.claim
d4b6deb6-ebe5-4fb2-9aa1-6dd86a06649f	true	access.token.claim
d4b6deb6-ebe5-4fb2-9aa1-6dd86a06649f	delegatorAlternateIdentifierType	claim.name
d4b6deb6-ebe5-4fb2-9aa1-6dd86a06649f	String	jsonType.label
dffebb51-fb7c-48b2-9ae5-3f1599262c92	true	userinfo.token.claim
dffebb51-fb7c-48b2-9ae5-3f1599262c92	delegatorTypeOfPerson	user.attribute
dffebb51-fb7c-48b2-9ae5-3f1599262c92	true	id.token.claim
dffebb51-fb7c-48b2-9ae5-3f1599262c92	true	access.token.claim
dffebb51-fb7c-48b2-9ae5-3f1599262c92	delegatorTypeOfPerson	claim.name
dffebb51-fb7c-48b2-9ae5-3f1599262c92	String	jsonType.label
5e8ac855-334c-4e83-84e1-d7e933c75c96	true	userinfo.token.claim
5e8ac855-334c-4e83-84e1-d7e933c75c96	delegatorAlternateName	user.attribute
5e8ac855-334c-4e83-84e1-d7e933c75c96	true	id.token.claim
5e8ac855-334c-4e83-84e1-d7e933c75c96	true	access.token.claim
5e8ac855-334c-4e83-84e1-d7e933c75c96	delegatorAlternateName	claim.name
5e8ac855-334c-4e83-84e1-d7e933c75c96	String	jsonType.label
d756868f-1f57-45a1-ad1c-45b238c5e92c	true	userinfo.token.claim
d756868f-1f57-45a1-ad1c-45b238c5e92c	delegatorAlternateIdentifier	user.attribute
d756868f-1f57-45a1-ad1c-45b238c5e92c	true	id.token.claim
d756868f-1f57-45a1-ad1c-45b238c5e92c	true	access.token.claim
d756868f-1f57-45a1-ad1c-45b238c5e92c	delegatorAlternateIdentifier	claim.name
d756868f-1f57-45a1-ad1c-45b238c5e92c	String	jsonType.label
c611ec10-aaf1-442a-be99-a83633332e59	true	userinfo.token.claim
c611ec10-aaf1-442a-be99-a83633332e59	countryCode	user.attribute
c611ec10-aaf1-442a-be99-a83633332e59	true	id.token.claim
c611ec10-aaf1-442a-be99-a83633332e59	true	access.token.claim
c611ec10-aaf1-442a-be99-a83633332e59	countryCode	claim.name
c611ec10-aaf1-442a-be99-a83633332e59	String	jsonType.label
bbc0dafa-8989-4f3c-8fc0-37eca928ad47	true	userinfo.token.claim
bbc0dafa-8989-4f3c-8fc0-37eca928ad47	delegatorIdentifier	user.attribute
bbc0dafa-8989-4f3c-8fc0-37eca928ad47	true	id.token.claim
bbc0dafa-8989-4f3c-8fc0-37eca928ad47	true	access.token.claim
bbc0dafa-8989-4f3c-8fc0-37eca928ad47	delegatorIdentifier	claim.name
bbc0dafa-8989-4f3c-8fc0-37eca928ad47	String	jsonType.label
cfd9fbae-7044-41e7-8cde-13833fabd55f	true	userinfo.token.claim
cfd9fbae-7044-41e7-8cde-13833fabd55f	typeOfActor	user.attribute
cfd9fbae-7044-41e7-8cde-13833fabd55f	true	id.token.claim
cfd9fbae-7044-41e7-8cde-13833fabd55f	true	access.token.claim
cfd9fbae-7044-41e7-8cde-13833fabd55f	typeOfActor	claim.name
cfd9fbae-7044-41e7-8cde-13833fabd55f	String	jsonType.label
fa32ce4e-0c41-4209-a15e-55d8fc35fafa	true	userinfo.token.claim
fa32ce4e-0c41-4209-a15e-55d8fc35fafa	eIdentifier	user.attribute
fa32ce4e-0c41-4209-a15e-55d8fc35fafa	true	id.token.claim
fa32ce4e-0c41-4209-a15e-55d8fc35fafa	true	access.token.claim
fa32ce4e-0c41-4209-a15e-55d8fc35fafa	eIdentifier	claim.name
fa32ce4e-0c41-4209-a15e-55d8fc35fafa	String	jsonType.label
178b0d1c-8d5f-4c82-a601-c1314cbc8d58	true	userinfo.token.claim
178b0d1c-8d5f-4c82-a601-c1314cbc8d58	delegatorCountryCode	user.attribute
178b0d1c-8d5f-4c82-a601-c1314cbc8d58	true	id.token.claim
178b0d1c-8d5f-4c82-a601-c1314cbc8d58	true	access.token.claim
178b0d1c-8d5f-4c82-a601-c1314cbc8d58	delegatorCountryCode	claim.name
178b0d1c-8d5f-4c82-a601-c1314cbc8d58	String	jsonType.label
f99a6077-cb1c-4088-9059-85781b0b911d	true	userinfo.token.claim
f99a6077-cb1c-4088-9059-85781b0b911d	typeOfPerson	user.attribute
f99a6077-cb1c-4088-9059-85781b0b911d	true	id.token.claim
f99a6077-cb1c-4088-9059-85781b0b911d	true	access.token.claim
f99a6077-cb1c-4088-9059-85781b0b911d	typeOfPerson	claim.name
f99a6077-cb1c-4088-9059-85781b0b911d	String	jsonType.label
508f3b6e-ad06-4be9-a7ca-c8b488da5c34	String	jsonType.label
54141af5-1950-4cdb-a9ac-017be26eb0a7	true	userinfo.token.claim
54141af5-1950-4cdb-a9ac-017be26eb0a7	profile	user.attribute
54141af5-1950-4cdb-a9ac-017be26eb0a7	true	id.token.claim
54141af5-1950-4cdb-a9ac-017be26eb0a7	true	access.token.claim
54141af5-1950-4cdb-a9ac-017be26eb0a7	profile	claim.name
54141af5-1950-4cdb-a9ac-017be26eb0a7	String	jsonType.label
86d7be4b-984e-4b85-a918-d196c0cf3143	true	userinfo.token.claim
86d7be4b-984e-4b85-a918-d196c0cf3143	true	id.token.claim
86d7be4b-984e-4b85-a918-d196c0cf3143	true	access.token.claim
cb24d0b0-99d8-4978-b27f-a0f578f889f1	false	single
cb24d0b0-99d8-4978-b27f-a0f578f889f1	Basic	attribute.nameformat
cb24d0b0-99d8-4978-b27f-a0f578f889f1	Role	attribute.name
2bb0275d-b833-4038-8812-ce749e29ab88	true	userinfo.token.claim
2bb0275d-b833-4038-8812-ce749e29ab88	true	id.token.claim
2bb0275d-b833-4038-8812-ce749e29ab88	true	access.token.claim
347f1e6a-75dc-49d6-acd2-363256848d32	true	userinfo.token.claim
347f1e6a-75dc-49d6-acd2-363256848d32	locale	user.attribute
347f1e6a-75dc-49d6-acd2-363256848d32	true	id.token.claim
347f1e6a-75dc-49d6-acd2-363256848d32	true	access.token.claim
347f1e6a-75dc-49d6-acd2-363256848d32	locale	claim.name
347f1e6a-75dc-49d6-acd2-363256848d32	String	jsonType.label
371933d6-1685-4ffd-bd38-debbd14e9e4c	true	userinfo.token.claim
371933d6-1685-4ffd-bd38-debbd14e9e4c	website	user.attribute
371933d6-1685-4ffd-bd38-debbd14e9e4c	true	id.token.claim
371933d6-1685-4ffd-bd38-debbd14e9e4c	true	access.token.claim
371933d6-1685-4ffd-bd38-debbd14e9e4c	website	claim.name
371933d6-1685-4ffd-bd38-debbd14e9e4c	String	jsonType.label
3d408755-01f0-43b4-94ec-e0b7052ad894	true	userinfo.token.claim
3d408755-01f0-43b4-94ec-e0b7052ad894	profile	user.attribute
3d408755-01f0-43b4-94ec-e0b7052ad894	true	id.token.claim
3d408755-01f0-43b4-94ec-e0b7052ad894	true	access.token.claim
3d408755-01f0-43b4-94ec-e0b7052ad894	profile	claim.name
3d408755-01f0-43b4-94ec-e0b7052ad894	String	jsonType.label
4a213f45-700c-4d64-8d92-ed111077df9e	true	userinfo.token.claim
4a213f45-700c-4d64-8d92-ed111077df9e	updatedAt	user.attribute
4a213f45-700c-4d64-8d92-ed111077df9e	true	id.token.claim
4a213f45-700c-4d64-8d92-ed111077df9e	true	access.token.claim
4a213f45-700c-4d64-8d92-ed111077df9e	updated_at	claim.name
4a213f45-700c-4d64-8d92-ed111077df9e	long	jsonType.label
94797e53-eb0f-4ff3-920e-0a66a0750e08	true	userinfo.token.claim
94797e53-eb0f-4ff3-920e-0a66a0750e08	username	user.attribute
94797e53-eb0f-4ff3-920e-0a66a0750e08	true	id.token.claim
94797e53-eb0f-4ff3-920e-0a66a0750e08	true	access.token.claim
94797e53-eb0f-4ff3-920e-0a66a0750e08	preferred_username	claim.name
94797e53-eb0f-4ff3-920e-0a66a0750e08	String	jsonType.label
97b92a73-b265-4cd3-a3bf-805a037c4a43	true	userinfo.token.claim
97b92a73-b265-4cd3-a3bf-805a037c4a43	nickname	user.attribute
97b92a73-b265-4cd3-a3bf-805a037c4a43	true	id.token.claim
97b92a73-b265-4cd3-a3bf-805a037c4a43	true	access.token.claim
97b92a73-b265-4cd3-a3bf-805a037c4a43	nickname	claim.name
97b92a73-b265-4cd3-a3bf-805a037c4a43	String	jsonType.label
a1d7971c-4a26-4e01-9a41-431f6f0f052f	true	userinfo.token.claim
a1d7971c-4a26-4e01-9a41-431f6f0f052f	lastName	user.attribute
a1d7971c-4a26-4e01-9a41-431f6f0f052f	true	id.token.claim
a1d7971c-4a26-4e01-9a41-431f6f0f052f	true	access.token.claim
a1d7971c-4a26-4e01-9a41-431f6f0f052f	family_name	claim.name
a1d7971c-4a26-4e01-9a41-431f6f0f052f	String	jsonType.label
a53ed964-69fc-4171-8774-3f6a57f55645	true	userinfo.token.claim
a53ed964-69fc-4171-8774-3f6a57f55645	zoneinfo	user.attribute
a53ed964-69fc-4171-8774-3f6a57f55645	true	id.token.claim
a53ed964-69fc-4171-8774-3f6a57f55645	true	access.token.claim
a53ed964-69fc-4171-8774-3f6a57f55645	zoneinfo	claim.name
a53ed964-69fc-4171-8774-3f6a57f55645	String	jsonType.label
cbe8374c-9570-4701-9d3c-2341b62854fc	true	userinfo.token.claim
cbe8374c-9570-4701-9d3c-2341b62854fc	middleName	user.attribute
cbe8374c-9570-4701-9d3c-2341b62854fc	true	id.token.claim
cbe8374c-9570-4701-9d3c-2341b62854fc	true	access.token.claim
cbe8374c-9570-4701-9d3c-2341b62854fc	middle_name	claim.name
cbe8374c-9570-4701-9d3c-2341b62854fc	String	jsonType.label
d205979f-c19c-464f-9b73-e8dd351ab565	true	userinfo.token.claim
d205979f-c19c-464f-9b73-e8dd351ab565	firstName	user.attribute
d205979f-c19c-464f-9b73-e8dd351ab565	true	id.token.claim
d205979f-c19c-464f-9b73-e8dd351ab565	true	access.token.claim
d205979f-c19c-464f-9b73-e8dd351ab565	given_name	claim.name
d205979f-c19c-464f-9b73-e8dd351ab565	String	jsonType.label
dae5822d-4164-4721-a197-159fe50020b2	true	userinfo.token.claim
dae5822d-4164-4721-a197-159fe50020b2	birthdate	user.attribute
dae5822d-4164-4721-a197-159fe50020b2	true	id.token.claim
dae5822d-4164-4721-a197-159fe50020b2	true	access.token.claim
dae5822d-4164-4721-a197-159fe50020b2	birthdate	claim.name
dae5822d-4164-4721-a197-159fe50020b2	String	jsonType.label
ef585f6c-a8e0-47bf-8f2f-21d975c33dd0	true	userinfo.token.claim
ef585f6c-a8e0-47bf-8f2f-21d975c33dd0	gender	user.attribute
ef585f6c-a8e0-47bf-8f2f-21d975c33dd0	true	id.token.claim
ef585f6c-a8e0-47bf-8f2f-21d975c33dd0	true	access.token.claim
ef585f6c-a8e0-47bf-8f2f-21d975c33dd0	gender	claim.name
ef585f6c-a8e0-47bf-8f2f-21d975c33dd0	String	jsonType.label
feee3287-b5ed-4718-b8df-87b837f25031	true	userinfo.token.claim
feee3287-b5ed-4718-b8df-87b837f25031	picture	user.attribute
feee3287-b5ed-4718-b8df-87b837f25031	true	id.token.claim
feee3287-b5ed-4718-b8df-87b837f25031	true	access.token.claim
feee3287-b5ed-4718-b8df-87b837f25031	picture	claim.name
feee3287-b5ed-4718-b8df-87b837f25031	String	jsonType.label
31742c93-1488-48ca-a6ac-2f12cd3e0a3e	true	userinfo.token.claim
31742c93-1488-48ca-a6ac-2f12cd3e0a3e	email	user.attribute
31742c93-1488-48ca-a6ac-2f12cd3e0a3e	true	id.token.claim
31742c93-1488-48ca-a6ac-2f12cd3e0a3e	true	access.token.claim
31742c93-1488-48ca-a6ac-2f12cd3e0a3e	email	claim.name
31742c93-1488-48ca-a6ac-2f12cd3e0a3e	String	jsonType.label
f6745f00-eb70-4110-9086-6bab6ace3fa4	true	userinfo.token.claim
f6745f00-eb70-4110-9086-6bab6ace3fa4	emailVerified	user.attribute
f6745f00-eb70-4110-9086-6bab6ace3fa4	true	id.token.claim
f6745f00-eb70-4110-9086-6bab6ace3fa4	true	access.token.claim
f6745f00-eb70-4110-9086-6bab6ace3fa4	email_verified	claim.name
f6745f00-eb70-4110-9086-6bab6ace3fa4	boolean	jsonType.label
21443738-d334-4d38-9464-5e7a48a07bd0	formatted	user.attribute.formatted
21443738-d334-4d38-9464-5e7a48a07bd0	country	user.attribute.country
21443738-d334-4d38-9464-5e7a48a07bd0	postal_code	user.attribute.postal_code
21443738-d334-4d38-9464-5e7a48a07bd0	true	userinfo.token.claim
21443738-d334-4d38-9464-5e7a48a07bd0	street	user.attribute.street
21443738-d334-4d38-9464-5e7a48a07bd0	true	id.token.claim
21443738-d334-4d38-9464-5e7a48a07bd0	region	user.attribute.region
21443738-d334-4d38-9464-5e7a48a07bd0	true	access.token.claim
21443738-d334-4d38-9464-5e7a48a07bd0	locality	user.attribute.locality
09340371-34ee-4de3-b6e8-6f8606731d79	true	userinfo.token.claim
09340371-34ee-4de3-b6e8-6f8606731d79	phoneNumber	user.attribute
09340371-34ee-4de3-b6e8-6f8606731d79	true	id.token.claim
09340371-34ee-4de3-b6e8-6f8606731d79	true	access.token.claim
09340371-34ee-4de3-b6e8-6f8606731d79	phone_number	claim.name
09340371-34ee-4de3-b6e8-6f8606731d79	String	jsonType.label
29d36701-68ae-47ce-acde-279a284e1a41	true	userinfo.token.claim
29d36701-68ae-47ce-acde-279a284e1a41	phoneNumberVerified	user.attribute
29d36701-68ae-47ce-acde-279a284e1a41	true	id.token.claim
29d36701-68ae-47ce-acde-279a284e1a41	true	access.token.claim
29d36701-68ae-47ce-acde-279a284e1a41	phone_number_verified	claim.name
29d36701-68ae-47ce-acde-279a284e1a41	boolean	jsonType.label
08d7bf38-f35b-4ad5-b292-fc7fe61f550b	true	multivalued
08d7bf38-f35b-4ad5-b292-fc7fe61f550b	foo	user.attribute
08d7bf38-f35b-4ad5-b292-fc7fe61f550b	true	access.token.claim
08d7bf38-f35b-4ad5-b292-fc7fe61f550b	realm_access.roles	claim.name
08d7bf38-f35b-4ad5-b292-fc7fe61f550b	String	jsonType.label
7de1450a-5367-4f95-8719-aa7bac0fe6ef	true	multivalued
7de1450a-5367-4f95-8719-aa7bac0fe6ef	foo	user.attribute
7de1450a-5367-4f95-8719-aa7bac0fe6ef	true	access.token.claim
7de1450a-5367-4f95-8719-aa7bac0fe6ef	resource_access.${client_id}.roles	claim.name
7de1450a-5367-4f95-8719-aa7bac0fe6ef	String	jsonType.label
4fcade81-dd49-466a-a1b7-d71db8ddf370	true	userinfo.token.claim
4fcade81-dd49-466a-a1b7-d71db8ddf370	username	user.attribute
4fcade81-dd49-466a-a1b7-d71db8ddf370	true	id.token.claim
4fcade81-dd49-466a-a1b7-d71db8ddf370	true	access.token.claim
4fcade81-dd49-466a-a1b7-d71db8ddf370	upn	claim.name
4fcade81-dd49-466a-a1b7-d71db8ddf370	String	jsonType.label
a74061bb-eeff-49ee-9ee4-ecc83af7940d	true	multivalued
a74061bb-eeff-49ee-9ee4-ecc83af7940d	foo	user.attribute
a74061bb-eeff-49ee-9ee4-ecc83af7940d	true	id.token.claim
a74061bb-eeff-49ee-9ee4-ecc83af7940d	true	access.token.claim
a74061bb-eeff-49ee-9ee4-ecc83af7940d	groups	claim.name
a74061bb-eeff-49ee-9ee4-ecc83af7940d	String	jsonType.label
6a31e95c-fec5-43df-b592-f1fa2c126dd9	true	id.token.claim
6a31e95c-fec5-43df-b592-f1fa2c126dd9	true	access.token.claim
e09e4fe2-1f42-4ccb-ba82-f128db9c4253	true	userinfo.token.claim
e09e4fe2-1f42-4ccb-ba82-f128db9c4253	locale	user.attribute
e09e4fe2-1f42-4ccb-ba82-f128db9c4253	true	id.token.claim
e09e4fe2-1f42-4ccb-ba82-f128db9c4253	true	access.token.claim
e09e4fe2-1f42-4ccb-ba82-f128db9c4253	locale	claim.name
e09e4fe2-1f42-4ccb-ba82-f128db9c4253	String	jsonType.label
86e82769-2c3d-4916-a7f2-1846a15f0063	true	userinfo.token.claim
86e82769-2c3d-4916-a7f2-1846a15f0063	firstName	user.attribute
86e82769-2c3d-4916-a7f2-1846a15f0063	true	id.token.claim
86e82769-2c3d-4916-a7f2-1846a15f0063	true	access.token.claim
86e82769-2c3d-4916-a7f2-1846a15f0063	given_name	claim.name
86e82769-2c3d-4916-a7f2-1846a15f0063	String	jsonType.label
904433f3-ade4-4f34-981c-d7863336c563	true	userinfo.token.claim
904433f3-ade4-4f34-981c-d7863336c563	zoneinfo	user.attribute
904433f3-ade4-4f34-981c-d7863336c563	true	id.token.claim
904433f3-ade4-4f34-981c-d7863336c563	true	access.token.claim
904433f3-ade4-4f34-981c-d7863336c563	zoneinfo	claim.name
904433f3-ade4-4f34-981c-d7863336c563	String	jsonType.label
9773cc8b-1921-4331-8153-06e8164b7956	true	userinfo.token.claim
9773cc8b-1921-4331-8153-06e8164b7956	username	user.attribute
9773cc8b-1921-4331-8153-06e8164b7956	true	id.token.claim
9773cc8b-1921-4331-8153-06e8164b7956	true	access.token.claim
9773cc8b-1921-4331-8153-06e8164b7956	preferred_username	claim.name
9773cc8b-1921-4331-8153-06e8164b7956	String	jsonType.label
aa155166-3cdb-4766-9578-52121570d9da	true	userinfo.token.claim
aa155166-3cdb-4766-9578-52121570d9da	nickname	user.attribute
aa155166-3cdb-4766-9578-52121570d9da	true	id.token.claim
aa155166-3cdb-4766-9578-52121570d9da	true	access.token.claim
aa155166-3cdb-4766-9578-52121570d9da	nickname	claim.name
aa155166-3cdb-4766-9578-52121570d9da	String	jsonType.label
b44c57e6-1eac-4c64-8c32-664f53c727c3	true	userinfo.token.claim
b44c57e6-1eac-4c64-8c32-664f53c727c3	website	user.attribute
b44c57e6-1eac-4c64-8c32-664f53c727c3	true	id.token.claim
b44c57e6-1eac-4c64-8c32-664f53c727c3	true	access.token.claim
b44c57e6-1eac-4c64-8c32-664f53c727c3	website	claim.name
b44c57e6-1eac-4c64-8c32-664f53c727c3	String	jsonType.label
d558bc25-4154-415d-a1fe-84d23c64d90e	true	userinfo.token.claim
d558bc25-4154-415d-a1fe-84d23c64d90e	updatedAt	user.attribute
d558bc25-4154-415d-a1fe-84d23c64d90e	true	id.token.claim
d558bc25-4154-415d-a1fe-84d23c64d90e	true	access.token.claim
d558bc25-4154-415d-a1fe-84d23c64d90e	updated_at	claim.name
d558bc25-4154-415d-a1fe-84d23c64d90e	long	jsonType.label
53e918fc-0c06-4de5-8d68-de431fd8971c	true	userinfo.token.claim
53e918fc-0c06-4de5-8d68-de431fd8971c	email	user.attribute
53e918fc-0c06-4de5-8d68-de431fd8971c	true	id.token.claim
53e918fc-0c06-4de5-8d68-de431fd8971c	true	access.token.claim
53e918fc-0c06-4de5-8d68-de431fd8971c	email	claim.name
53e918fc-0c06-4de5-8d68-de431fd8971c	String	jsonType.label
9b1501ce-ae19-49cb-94a6-d7a3d5872746	true	userinfo.token.claim
9b1501ce-ae19-49cb-94a6-d7a3d5872746	emailVerified	user.attribute
9b1501ce-ae19-49cb-94a6-d7a3d5872746	true	id.token.claim
9b1501ce-ae19-49cb-94a6-d7a3d5872746	true	access.token.claim
9b1501ce-ae19-49cb-94a6-d7a3d5872746	email_verified	claim.name
9b1501ce-ae19-49cb-94a6-d7a3d5872746	boolean	jsonType.label
e472b2fe-82d8-45a3-80e3-bc0410c236fe	formatted	user.attribute.formatted
e472b2fe-82d8-45a3-80e3-bc0410c236fe	country	user.attribute.country
e472b2fe-82d8-45a3-80e3-bc0410c236fe	postal_code	user.attribute.postal_code
e472b2fe-82d8-45a3-80e3-bc0410c236fe	true	userinfo.token.claim
e472b2fe-82d8-45a3-80e3-bc0410c236fe	street	user.attribute.street
e472b2fe-82d8-45a3-80e3-bc0410c236fe	true	id.token.claim
e472b2fe-82d8-45a3-80e3-bc0410c236fe	region	user.attribute.region
e472b2fe-82d8-45a3-80e3-bc0410c236fe	true	access.token.claim
e472b2fe-82d8-45a3-80e3-bc0410c236fe	locality	user.attribute.locality
c7bbd925-5f6c-46c3-9dbc-0998825749f3	true	userinfo.token.claim
c7bbd925-5f6c-46c3-9dbc-0998825749f3	phoneNumber	user.attribute
c7bbd925-5f6c-46c3-9dbc-0998825749f3	true	id.token.claim
c7bbd925-5f6c-46c3-9dbc-0998825749f3	true	access.token.claim
c7bbd925-5f6c-46c3-9dbc-0998825749f3	phone_number	claim.name
c7bbd925-5f6c-46c3-9dbc-0998825749f3	String	jsonType.label
e63221b0-7f14-48ed-b4da-3535d2e8f6ad	true	userinfo.token.claim
e63221b0-7f14-48ed-b4da-3535d2e8f6ad	phoneNumberVerified	user.attribute
e63221b0-7f14-48ed-b4da-3535d2e8f6ad	true	id.token.claim
e63221b0-7f14-48ed-b4da-3535d2e8f6ad	true	access.token.claim
e63221b0-7f14-48ed-b4da-3535d2e8f6ad	phone_number_verified	claim.name
e63221b0-7f14-48ed-b4da-3535d2e8f6ad	boolean	jsonType.label
8854f3be-1179-41e4-93d1-f2b048560cda	true	multivalued
8854f3be-1179-41e4-93d1-f2b048560cda	foo	user.attribute
8854f3be-1179-41e4-93d1-f2b048560cda	true	access.token.claim
8854f3be-1179-41e4-93d1-f2b048560cda	realm_access.roles	claim.name
8854f3be-1179-41e4-93d1-f2b048560cda	String	jsonType.label
9a616c7d-e066-44f5-bbb3-d1c5124b2524	true	multivalued
9a616c7d-e066-44f5-bbb3-d1c5124b2524	foo	user.attribute
9a616c7d-e066-44f5-bbb3-d1c5124b2524	true	access.token.claim
9a616c7d-e066-44f5-bbb3-d1c5124b2524	resource_access.${client_id}.roles	claim.name
9a616c7d-e066-44f5-bbb3-d1c5124b2524	String	jsonType.label
60517bff-3ed5-47d1-91cb-e99e3be0cd3e	true	multivalued
60517bff-3ed5-47d1-91cb-e99e3be0cd3e	foo	user.attribute
60517bff-3ed5-47d1-91cb-e99e3be0cd3e	true	id.token.claim
60517bff-3ed5-47d1-91cb-e99e3be0cd3e	true	access.token.claim
60517bff-3ed5-47d1-91cb-e99e3be0cd3e	groups	claim.name
60517bff-3ed5-47d1-91cb-e99e3be0cd3e	String	jsonType.label
87f7ff8b-628d-4d36-b17a-d087b541445c	true	userinfo.token.claim
87f7ff8b-628d-4d36-b17a-d087b541445c	username	user.attribute
87f7ff8b-628d-4d36-b17a-d087b541445c	true	id.token.claim
87f7ff8b-628d-4d36-b17a-d087b541445c	true	access.token.claim
87f7ff8b-628d-4d36-b17a-d087b541445c	upn	claim.name
87f7ff8b-628d-4d36-b17a-d087b541445c	String	jsonType.label
d26d7ed4-cb1d-4008-ab27-f72c722bb038	true	id.token.claim
d26d7ed4-cb1d-4008-ab27-f72c722bb038	true	access.token.claim
fa81948f-663b-45ec-add2-cebb9e1c8191	true	userinfo.token.claim
fa81948f-663b-45ec-add2-cebb9e1c8191	locale	user.attribute
fa81948f-663b-45ec-add2-cebb9e1c8191	true	id.token.claim
fa81948f-663b-45ec-add2-cebb9e1c8191	true	access.token.claim
fa81948f-663b-45ec-add2-cebb9e1c8191	locale	claim.name
fa81948f-663b-45ec-add2-cebb9e1c8191	String	jsonType.label
b153d929-1b52-417f-b0b2-3b23488c1ba9	true	userinfo.token.claim
b153d929-1b52-417f-b0b2-3b23488c1ba9	skatMedarbejderADAfdelingKontor	user.attribute
b153d929-1b52-417f-b0b2-3b23488c1ba9	true	id.token.claim
b153d929-1b52-417f-b0b2-3b23488c1ba9	true	access.token.claim
b153d929-1b52-417f-b0b2-3b23488c1ba9	skatMedarbejderADAfdelingKontor	claim.name
b153d929-1b52-417f-b0b2-3b23488c1ba9	String	jsonType.label
b15735bf-c5cc-4706-ac2d-636b24e849e1	true	userinfo.token.claim
b15735bf-c5cc-4706-ac2d-636b24e849e1	skatMedarbejderADNummer	user.attribute
b15735bf-c5cc-4706-ac2d-636b24e849e1	true	id.token.claim
b15735bf-c5cc-4706-ac2d-636b24e849e1	true	access.token.claim
b15735bf-c5cc-4706-ac2d-636b24e849e1	skatMedarbejderADNummer	claim.name
b15735bf-c5cc-4706-ac2d-636b24e849e1	String	jsonType.label
ec074af9-f8d7-4fe6-a64c-731d98295391	true	id.token.claim
ec074af9-f8d7-4fe6-a64c-731d98295391	true	userinfo.token.claim
57e0993a-b16f-4c0c-90b0-7befeab34f86	true	userinfo.token.claim
57e0993a-b16f-4c0c-90b0-7befeab34f86	true	id.token.claim
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
cb748a80-a440-40dc-ba38-53857fbff49b	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	dc9be43b-8068-492e-a0f5-9d96e465557c	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	49227233-408c-4cf0-9d24-5d708d0e035d	68bed145-2593-4c6f-b405-acc017cae06e	386db045-3471-407a-b862-9e07f35d70e6	f0df8b26-3a15-4c1f-80ba-b61c5265c4a8	dc5106b9-7804-4644-ad29-fa251c88f86d	2592000	f	900	t	f	2916ed9c-0609-40a0-8021-c86b8c27f943	0	f	0	0	f245c712-a381-4ac4-bb2e-193e9a3ec9a6
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	60	300	300	\N	\N	\N	t	f	0	\N	local	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	4ba52d1e-3069-4e20-9ae8-633d3f825441	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	55cc45ae-3056-40d3-8d88-527450aec69f	289ae116-a600-47d3-b229-4d3ce62668c0	04d623a2-81bb-4103-a28a-1df5745dae61	83a80a27-b49e-4b50-809f-187b24adb249	d5ba03b1-55dc-4165-abf6-5024141610f1	2592000	f	900	t	f	553327f1-94cc-4588-84f1-1e6895067fd0	0	f	0	0	87f1ba85-55c3-4fd0-aded-2235a0979bcf
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	60	300	300	\N	\N	\N	t	f	0	\N	dcs	0	\N	f	f	f	f	NONE	1800	36000	f	f	59e17908-b00e-489f-9d33-3b3b300f25da	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	c0ec2fa0-773d-4cdf-bdf9-92d562839ecd	dd5b2f2d-f7d4-475c-85b5-4ab0a249eba3	4b9d1e39-7aee-4e32-aae8-f448bf4e02af	ad61aa7d-ab88-42f6-b9c9-16eda785c66d	757eef86-90b5-48f7-9a07-ac5d509717bd	2592000	f	900	t	f	ccf57df5-d56c-4a60-aadb-a062c0a92bc5	0	f	0	0	65b905f9-d2a1-4a88-b361-780f85c5c0a7
e8cfaa41-db82-4979-8f75-429ff43b53b9	60	300	28800	\N	\N	\N	t	f	0	\N	azure	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	38b52156-c1d2-4af9-afb4-730ae8eb1cd3	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	e58ed25f-452d-4738-9e1f-bd4c6f5d7ce3	9b850c97-414c-425c-913a-800bdd4afcc4	519a23cc-1e49-4561-8275-ab1c11facb52	c65a5c59-146b-4c17-bce9-5cfe6bca1c2f	9a2919b1-b109-4817-8549-a3741f84296d	2592000	f	28800	f	f	063c819a-f387-4701-acf8-1d4e6ba2742a	0	f	0	0	dcd95271-392e-4636-aa12-4aa46e20ef5e
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	cb748a80-a440-40dc-ba38-53857fbff49b	
_browser_header.xContentTypeOptions	cb748a80-a440-40dc-ba38-53857fbff49b	nosniff
_browser_header.referrerPolicy	cb748a80-a440-40dc-ba38-53857fbff49b	no-referrer
_browser_header.xRobotsTag	cb748a80-a440-40dc-ba38-53857fbff49b	none
_browser_header.xFrameOptions	cb748a80-a440-40dc-ba38-53857fbff49b	SAMEORIGIN
_browser_header.contentSecurityPolicy	cb748a80-a440-40dc-ba38-53857fbff49b	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	cb748a80-a440-40dc-ba38-53857fbff49b	1; mode=block
_browser_header.strictTransportSecurity	cb748a80-a440-40dc-ba38-53857fbff49b	max-age=31536000; includeSubDomains
bruteForceProtected	cb748a80-a440-40dc-ba38-53857fbff49b	false
permanentLockout	cb748a80-a440-40dc-ba38-53857fbff49b	false
maxFailureWaitSeconds	cb748a80-a440-40dc-ba38-53857fbff49b	900
minimumQuickLoginWaitSeconds	cb748a80-a440-40dc-ba38-53857fbff49b	60
waitIncrementSeconds	cb748a80-a440-40dc-ba38-53857fbff49b	60
quickLoginCheckMilliSeconds	cb748a80-a440-40dc-ba38-53857fbff49b	1000
maxDeltaTimeSeconds	cb748a80-a440-40dc-ba38-53857fbff49b	43200
failureFactor	cb748a80-a440-40dc-ba38-53857fbff49b	30
realmReusableOtpCode	cb748a80-a440-40dc-ba38-53857fbff49b	false
displayName	cb748a80-a440-40dc-ba38-53857fbff49b	Keycloak
displayNameHtml	cb748a80-a440-40dc-ba38-53857fbff49b	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	cb748a80-a440-40dc-ba38-53857fbff49b	RS256
offlineSessionMaxLifespanEnabled	cb748a80-a440-40dc-ba38-53857fbff49b	false
offlineSessionMaxLifespan	cb748a80-a440-40dc-ba38-53857fbff49b	5184000
_browser_header.contentSecurityPolicyReportOnly	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	
_browser_header.xContentTypeOptions	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	nosniff
_browser_header.referrerPolicy	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	no-referrer
_browser_header.xRobotsTag	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	none
_browser_header.xFrameOptions	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	SAMEORIGIN
_browser_header.contentSecurityPolicy	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	1; mode=block
_browser_header.strictTransportSecurity	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	max-age=31536000; includeSubDomains
bruteForceProtected	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	false
permanentLockout	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	false
maxFailureWaitSeconds	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	900
minimumQuickLoginWaitSeconds	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	60
waitIncrementSeconds	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	60
quickLoginCheckMilliSeconds	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	1000
maxDeltaTimeSeconds	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	43200
failureFactor	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	30
realmReusableOtpCode	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	false
defaultSignatureAlgorithm	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	RS256
offlineSessionMaxLifespanEnabled	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	false
offlineSessionMaxLifespan	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	5184000
actionTokenGeneratedByAdminLifespan	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	43200
actionTokenGeneratedByUserLifespan	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	300
oauth2DeviceCodeLifespan	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	600
oauth2DevicePollingInterval	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	5
webAuthnPolicyRpEntityName	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	keycloak
webAuthnPolicySignatureAlgorithms	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	ES256
webAuthnPolicyRpId	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	
webAuthnPolicyAttestationConveyancePreference	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	not specified
webAuthnPolicyAuthenticatorAttachment	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	not specified
webAuthnPolicyRequireResidentKey	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	not specified
webAuthnPolicyUserVerificationRequirement	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	not specified
webAuthnPolicyCreateTimeout	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	0
webAuthnPolicyAvoidSameAuthenticatorRegister	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	false
webAuthnPolicyRpEntityNamePasswordless	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	ES256
webAuthnPolicyRpIdPasswordless	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	
webAuthnPolicyAttestationConveyancePreferencePasswordless	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	not specified
webAuthnPolicyRequireResidentKeyPasswordless	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	not specified
webAuthnPolicyCreateTimeoutPasswordless	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	false
cibaBackchannelTokenDeliveryMode	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	poll
cibaExpiresIn	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	120
cibaInterval	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	5
cibaAuthRequestedUserHint	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	login_hint
parRequestUriLifespan	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	60
realmReusableOtpCode	e8cfaa41-db82-4979-8f75-429ff43b53b9	false
oauth2DevicePollingInterval	e8cfaa41-db82-4979-8f75-429ff43b53b9	5
cibaBackchannelTokenDeliveryMode	e8cfaa41-db82-4979-8f75-429ff43b53b9	poll
cibaExpiresIn	e8cfaa41-db82-4979-8f75-429ff43b53b9	120
cibaInterval	e8cfaa41-db82-4979-8f75-429ff43b53b9	5
cibaAuthRequestedUserHint	e8cfaa41-db82-4979-8f75-429ff43b53b9	login_hint
parRequestUriLifespan	e8cfaa41-db82-4979-8f75-429ff43b53b9	60
frontendUrl	e8cfaa41-db82-4979-8f75-429ff43b53b9	
acr.loa.map	e8cfaa41-db82-4979-8f75-429ff43b53b9	{}
realmReusableOtpCode	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	false
clientSessionIdleTimeout	e8cfaa41-db82-4979-8f75-429ff43b53b9	0
clientSessionMaxLifespan	e8cfaa41-db82-4979-8f75-429ff43b53b9	0
clientOfflineSessionIdleTimeout	e8cfaa41-db82-4979-8f75-429ff43b53b9	0
clientOfflineSessionMaxLifespan	e8cfaa41-db82-4979-8f75-429ff43b53b9	0
oauth2DeviceCodeLifespan	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	600
oauth2DevicePollingInterval	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	5
cibaBackchannelTokenDeliveryMode	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	poll
cibaExpiresIn	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	120
cibaInterval	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	5
cibaAuthRequestedUserHint	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	login_hint
parRequestUriLifespan	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	60
frontendUrl	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	
acr.loa.map	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	{}
displayName	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	DCS Emulator
displayNameHtml	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	
bruteForceProtected	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	false
permanentLockout	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	false
maxFailureWaitSeconds	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	900
minimumQuickLoginWaitSeconds	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	60
waitIncrementSeconds	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	60
quickLoginCheckMilliSeconds	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	1000
maxDeltaTimeSeconds	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	43200
failureFactor	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	30
actionTokenGeneratedByAdminLifespan	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	43200
actionTokenGeneratedByUserLifespan	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	300
defaultSignatureAlgorithm	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	RS256
offlineSessionMaxLifespanEnabled	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	false
offlineSessionMaxLifespan	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	5184000
clientSessionIdleTimeout	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	0
clientSessionMaxLifespan	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	0
clientOfflineSessionIdleTimeout	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	0
clientOfflineSessionMaxLifespan	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	0
webAuthnPolicyRpEntityName	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	keycloak
webAuthnPolicySignatureAlgorithms	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ES256
webAuthnPolicyRpId	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	
webAuthnPolicyAttestationConveyancePreference	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	not specified
webAuthnPolicyAuthenticatorAttachment	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	not specified
webAuthnPolicyRequireResidentKey	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	not specified
webAuthnPolicyUserVerificationRequirement	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	not specified
webAuthnPolicyCreateTimeout	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	0
webAuthnPolicyAvoidSameAuthenticatorRegister	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	false
webAuthnPolicyRpEntityNamePasswordless	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	ES256
webAuthnPolicyRpIdPasswordless	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	
webAuthnPolicyAttestationConveyancePreferencePasswordless	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	not specified
webAuthnPolicyRequireResidentKeyPasswordless	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	not specified
webAuthnPolicyCreateTimeoutPasswordless	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	false
client-policies.profiles	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	{"profiles":[]}
client-policies.policies	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	
_browser_header.xContentTypeOptions	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	nosniff
_browser_header.referrerPolicy	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	no-referrer
_browser_header.xRobotsTag	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	none
_browser_header.xFrameOptions	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	SAMEORIGIN
_browser_header.contentSecurityPolicy	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	1; mode=block
_browser_header.strictTransportSecurity	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	max-age=31536000; includeSubDomains
shortVerificationUri	e8cfaa41-db82-4979-8f75-429ff43b53b9	
actionTokenGeneratedByUserLifespan-verify-email	e8cfaa41-db82-4979-8f75-429ff43b53b9	
actionTokenGeneratedByUserLifespan-idp-verify-account-via-email	e8cfaa41-db82-4979-8f75-429ff43b53b9	
actionTokenGeneratedByUserLifespan-reset-credentials	e8cfaa41-db82-4979-8f75-429ff43b53b9	
actionTokenGeneratedByUserLifespan-execute-actions	e8cfaa41-db82-4979-8f75-429ff43b53b9	
displayName	e8cfaa41-db82-4979-8f75-429ff43b53b9	AZURE Emulated Realm
displayNameHtml	e8cfaa41-db82-4979-8f75-429ff43b53b9	
bruteForceProtected	e8cfaa41-db82-4979-8f75-429ff43b53b9	false
permanentLockout	e8cfaa41-db82-4979-8f75-429ff43b53b9	false
maxFailureWaitSeconds	e8cfaa41-db82-4979-8f75-429ff43b53b9	900
minimumQuickLoginWaitSeconds	e8cfaa41-db82-4979-8f75-429ff43b53b9	60
waitIncrementSeconds	e8cfaa41-db82-4979-8f75-429ff43b53b9	60
quickLoginCheckMilliSeconds	e8cfaa41-db82-4979-8f75-429ff43b53b9	1000
maxDeltaTimeSeconds	e8cfaa41-db82-4979-8f75-429ff43b53b9	43200
failureFactor	e8cfaa41-db82-4979-8f75-429ff43b53b9	30
actionTokenGeneratedByAdminLifespan	e8cfaa41-db82-4979-8f75-429ff43b53b9	43200
actionTokenGeneratedByUserLifespan	e8cfaa41-db82-4979-8f75-429ff43b53b9	300
defaultSignatureAlgorithm	e8cfaa41-db82-4979-8f75-429ff43b53b9	RS256
oauth2DeviceCodeLifespan	e8cfaa41-db82-4979-8f75-429ff43b53b9	28800
offlineSessionMaxLifespanEnabled	e8cfaa41-db82-4979-8f75-429ff43b53b9	false
offlineSessionMaxLifespan	e8cfaa41-db82-4979-8f75-429ff43b53b9	5184000
webAuthnPolicyRpEntityName	e8cfaa41-db82-4979-8f75-429ff43b53b9	keycloak
webAuthnPolicySignatureAlgorithms	e8cfaa41-db82-4979-8f75-429ff43b53b9	ES256
webAuthnPolicyRpId	e8cfaa41-db82-4979-8f75-429ff43b53b9	
webAuthnPolicyAttestationConveyancePreference	e8cfaa41-db82-4979-8f75-429ff43b53b9	not specified
webAuthnPolicyAuthenticatorAttachment	e8cfaa41-db82-4979-8f75-429ff43b53b9	not specified
webAuthnPolicyRequireResidentKey	e8cfaa41-db82-4979-8f75-429ff43b53b9	not specified
webAuthnPolicyUserVerificationRequirement	e8cfaa41-db82-4979-8f75-429ff43b53b9	not specified
webAuthnPolicyCreateTimeout	e8cfaa41-db82-4979-8f75-429ff43b53b9	0
webAuthnPolicyAvoidSameAuthenticatorRegister	e8cfaa41-db82-4979-8f75-429ff43b53b9	false
webAuthnPolicyRpEntityNamePasswordless	e8cfaa41-db82-4979-8f75-429ff43b53b9	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	e8cfaa41-db82-4979-8f75-429ff43b53b9	ES256
webAuthnPolicyRpIdPasswordless	e8cfaa41-db82-4979-8f75-429ff43b53b9	
webAuthnPolicyAttestationConveyancePreferencePasswordless	e8cfaa41-db82-4979-8f75-429ff43b53b9	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	e8cfaa41-db82-4979-8f75-429ff43b53b9	not specified
webAuthnPolicyRequireResidentKeyPasswordless	e8cfaa41-db82-4979-8f75-429ff43b53b9	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	e8cfaa41-db82-4979-8f75-429ff43b53b9	not specified
webAuthnPolicyCreateTimeoutPasswordless	e8cfaa41-db82-4979-8f75-429ff43b53b9	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	e8cfaa41-db82-4979-8f75-429ff43b53b9	false
client-policies.profiles	e8cfaa41-db82-4979-8f75-429ff43b53b9	{"profiles":[]}
client-policies.policies	e8cfaa41-db82-4979-8f75-429ff43b53b9	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	e8cfaa41-db82-4979-8f75-429ff43b53b9	
_browser_header.xContentTypeOptions	e8cfaa41-db82-4979-8f75-429ff43b53b9	nosniff
_browser_header.referrerPolicy	e8cfaa41-db82-4979-8f75-429ff43b53b9	no-referrer
_browser_header.xRobotsTag	e8cfaa41-db82-4979-8f75-429ff43b53b9	none
_browser_header.xFrameOptions	e8cfaa41-db82-4979-8f75-429ff43b53b9	SAMEORIGIN
_browser_header.contentSecurityPolicy	e8cfaa41-db82-4979-8f75-429ff43b53b9	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	e8cfaa41-db82-4979-8f75-429ff43b53b9	1; mode=block
_browser_header.strictTransportSecurity	e8cfaa41-db82-4979-8f75-429ff43b53b9	max-age=31536000; includeSubDomains
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
cb748a80-a440-40dc-ba38-53857fbff49b	jboss-logging
c3ee8ea6-caa2-48fa-95c4-679f16ec203a	jboss-logging
f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	jboss-logging
e8cfaa41-db82-4979-8f75-429ff43b53b9	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	cb748a80-a440-40dc-ba38-53857fbff49b
password	password	t	t	c3ee8ea6-caa2-48fa-95c4-679f16ec203a
password	password	t	t	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1
password	password	t	t	e8cfaa41-db82-4979-8f75-429ff43b53b9
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
d5282b6f-d7eb-4a78-9b7f-a1b61219229d	/realms/master/account/*
4389593f-caca-4f5a-9deb-3e2cc20892da	/realms/master/account/*
7d83e93d-0083-4e82-994f-2da2b7a5ac46	/admin/master/console/*
865f4804-4069-4a4c-b155-9a16686c3465	/realms/local/account/*
2682a4aa-1e30-4d13-bd52-67435bb29ac2	/realms/local/account/*
c1a4b05c-5a99-4092-9593-2081bc7a1c30	/admin/local/console/*
41a1caef-08cf-47a5-80c0-98aff7ae2f33	http://logbog-kontrol.localhost/*
41a1caef-08cf-47a5-80c0-98aff7ae2f33	http://localhost:8080/*
41a1caef-08cf-47a5-80c0-98aff7ae2f33	http://logbog-virksomhed.localhost/*
ab24de49-f9f2-4708-8f42-3c51040d035b	/realms/dcs/account/*
35bf4270-3a4c-4caf-9241-b183b0a838fe	/realms/dcs/account/*
12215ae6-3f08-4e58-b662-ff85df0effb1	/admin/dcs/console/*
dc94d641-7e97-455e-970b-f3e58ae7eb03	/realms/azure/account/*
748c182c-60f3-47cd-bcad-e836a4ae5090	/realms/azure/account/*
b5858d86-6a83-43ba-a4b0-a0dd5e663059	/admin/azure/console/*
4beaf17c-a463-4896-9314-a4b22bd894b5	http://localhost:8080/*
4beaf17c-a463-4896-9314-a4b22bd894b5	http://sikved.localhost/*
4beaf17c-a463-4896-9314-a4b22bd894b5	*
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	/*
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	http://ligningslov.localtest.me/*
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	http://localhost:8080/*
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	http://logbog-virksomhed.localtest.me/*
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	http://logbog-virksomhed.localhost/*
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	http://localhost:5012/*
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	https://logbog-virksomhed.localtest.me/*
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	http://localhost:5011/*
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	http://localhost:5000/*
a09f6280-72d4-41eb-8043-78a465df485b	https://toko.localtest.me/*
a09f6280-72d4-41eb-8043-78a465df485b	toldkontrol:/callback
a09f6280-72d4-41eb-8043-78a465df485b	http://toko.localtest.me/*
3b60edca-5a67-4e90-b024-5f870858001b	http://localhost:4200/*
3b60edca-5a67-4e90-b024-5f870858001b	https://dataudveksling.localtest.me/*
3b60edca-5a67-4e90-b024-5f870858001b	http://dataudveksling.localtest.me/*
6abdd522-ccc5-4de9-88eb-83c8366acdc2	http://logbog-kontrol.localhost/*
6abdd522-ccc5-4de9-88eb-83c8366acdc2	http://logbog-kontrol.localtest.me/*
6abdd522-ccc5-4de9-88eb-83c8366acdc2	http://localhost:5012/*
6abdd522-ccc5-4de9-88eb-83c8366acdc2	https://logbog-kontrol.localtest.me/*
6abdd522-ccc5-4de9-88eb-83c8366acdc2	http://localhost:5000/*
977c1cf5-951a-41d0-82d1-e78c0297d109	http://localhost:8080/*
977c1cf5-951a-41d0-82d1-e78c0297d109	http://skattekonto.localhost/*
977c1cf5-951a-41d0-82d1-e78c0297d109	*
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	https://toldkontrol-web.localtest.me
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	https://toldkontrol-api.localtest.me
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
a2551893-8121-4eb6-8c8e-2ba87f951f6b	VERIFY_EMAIL	Verify Email	cb748a80-a440-40dc-ba38-53857fbff49b	t	f	VERIFY_EMAIL	50
3ea8ad6f-7db5-4890-a085-f51d24e43248	UPDATE_PROFILE	Update Profile	cb748a80-a440-40dc-ba38-53857fbff49b	t	f	UPDATE_PROFILE	40
1b9ee65c-f20d-4f9d-bcc1-234140a0cdd2	CONFIGURE_TOTP	Configure OTP	cb748a80-a440-40dc-ba38-53857fbff49b	t	f	CONFIGURE_TOTP	10
9ab9daa8-f1fb-49b9-b132-96a4e559d6ca	UPDATE_PASSWORD	Update Password	cb748a80-a440-40dc-ba38-53857fbff49b	t	f	UPDATE_PASSWORD	30
30f34e50-5056-4116-a655-b4c75be66522	TERMS_AND_CONDITIONS	Terms and Conditions	cb748a80-a440-40dc-ba38-53857fbff49b	f	f	TERMS_AND_CONDITIONS	20
0d8167b4-c571-4549-8e03-783bc70b43c7	delete_account	Delete Account	cb748a80-a440-40dc-ba38-53857fbff49b	f	f	delete_account	60
d1589ea3-d8a7-4368-bfc2-a51ef48fe5b3	update_user_locale	Update User Locale	cb748a80-a440-40dc-ba38-53857fbff49b	t	f	update_user_locale	1000
b7b5beed-1510-4581-aba5-d35883e3ef36	webauthn-register	Webauthn Register	cb748a80-a440-40dc-ba38-53857fbff49b	t	f	webauthn-register	70
d5dfb01e-3ba3-4195-b82e-ab36a9943c3b	webauthn-register-passwordless	Webauthn Register Passwordless	cb748a80-a440-40dc-ba38-53857fbff49b	t	f	webauthn-register-passwordless	80
a85e8509-9f02-4b8a-8dbb-77a62b0df90c	VERIFY_EMAIL	Verify Email	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	t	f	VERIFY_EMAIL	50
e34ff964-c239-4b18-b0b1-be0c313df339	UPDATE_PROFILE	Update Profile	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	t	f	UPDATE_PROFILE	40
29abe952-6248-41c4-975e-60b3290ac811	CONFIGURE_TOTP	Configure OTP	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	t	f	CONFIGURE_TOTP	10
2d759020-f1fe-4499-8e01-6d768be005bc	UPDATE_PASSWORD	Update Password	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	t	f	UPDATE_PASSWORD	30
1afe38d9-5068-4b4a-bc7e-a4b84a1a9439	TERMS_AND_CONDITIONS	Terms and Conditions	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	f	f	TERMS_AND_CONDITIONS	20
9e492079-404b-4eb7-ae0a-15a30e558423	delete_account	Delete Account	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	f	f	delete_account	60
0ee977e3-2eb8-4dc9-8502-fdd9fe2e99cf	update_user_locale	Update User Locale	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	t	f	update_user_locale	1000
14cb620b-5bc9-4800-a881-311c95d36009	webauthn-register	Webauthn Register	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	t	f	webauthn-register	70
88d9f390-8fb6-429e-9e6d-c1b2fc082a86	webauthn-register-passwordless	Webauthn Register Passwordless	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	t	f	webauthn-register-passwordless	80
339c2632-eb5e-4923-8797-c522441c5601	VERIFY_EMAIL	Verify Email	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	t	f	VERIFY_EMAIL	50
feaa12c1-3ef7-48da-bc15-2145b9964bc0	UPDATE_PROFILE	Update Profile	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	t	f	UPDATE_PROFILE	40
a275fc53-046d-451e-bb69-c50ea52b2e62	CONFIGURE_TOTP	Configure OTP	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	t	f	CONFIGURE_TOTP	10
91938388-66ac-4a5e-aff6-75cd3aca39c0	UPDATE_PASSWORD	Update Password	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	t	f	UPDATE_PASSWORD	30
fefcb3ca-014e-410e-81ae-0273ff00c9ae	TERMS_AND_CONDITIONS	Terms and Conditions	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	f	f	TERMS_AND_CONDITIONS	20
254939d3-ceee-4861-9680-9c3dc8d0285e	delete_account	Delete Account	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	f	f	delete_account	60
79975b76-84f4-4c4f-9ec3-75f56e071c98	update_user_locale	Update User Locale	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	t	f	update_user_locale	1000
0519bdcc-11a3-4982-8af2-9cd4fdb40777	webauthn-register	Webauthn Register	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	t	f	webauthn-register	70
14204227-806a-4887-9c90-7d36b2c99f93	webauthn-register-passwordless	Webauthn Register Passwordless	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	t	f	webauthn-register-passwordless	80
adda3a95-87d9-48d7-9ff4-0955dcf5d02f	VERIFY_EMAIL	Verify Email	e8cfaa41-db82-4979-8f75-429ff43b53b9	t	f	VERIFY_EMAIL	50
081195ed-f710-4c02-b84d-70f5fd9c40fa	UPDATE_PROFILE	Update Profile	e8cfaa41-db82-4979-8f75-429ff43b53b9	t	f	UPDATE_PROFILE	40
84e17eb0-6153-424e-95b9-32d5ea04e4ac	CONFIGURE_TOTP	Configure OTP	e8cfaa41-db82-4979-8f75-429ff43b53b9	t	f	CONFIGURE_TOTP	10
ef1b4e71-d9be-4016-8bd8-7efecad640a2	UPDATE_PASSWORD	Update Password	e8cfaa41-db82-4979-8f75-429ff43b53b9	t	f	UPDATE_PASSWORD	30
c53412fc-efac-4db8-8241-2f117f1bd916	TERMS_AND_CONDITIONS	Terms and Conditions	e8cfaa41-db82-4979-8f75-429ff43b53b9	f	f	TERMS_AND_CONDITIONS	20
ed449abb-c14d-4835-851f-121eaa039654	delete_account	Delete Account	e8cfaa41-db82-4979-8f75-429ff43b53b9	f	f	delete_account	60
b80b3366-71d8-4246-a13d-63987e371eae	update_user_locale	Update User Locale	e8cfaa41-db82-4979-8f75-429ff43b53b9	t	f	update_user_locale	1000
53123a81-62e5-462d-811d-393fdfc9d107	webauthn-register	Webauthn Register	e8cfaa41-db82-4979-8f75-429ff43b53b9	t	f	webauthn-register	70
b3d9fd3f-e6f7-4d82-9085-56fff3424109	webauthn-register-passwordless	Webauthn Register Passwordless	e8cfaa41-db82-4979-8f75-429ff43b53b9	t	f	webauthn-register-passwordless	80
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
4389593f-caca-4f5a-9deb-3e2cc20892da	2ff7c508-8ef1-4fac-9136-eada415094a9
4389593f-caca-4f5a-9deb-3e2cc20892da	75e31298-e64c-4861-baf3-9eb7a091a2cb
2682a4aa-1e30-4d13-bd52-67435bb29ac2	22001e30-8364-49d3-a29d-2ec575b3ae24
2682a4aa-1e30-4d13-bd52-67435bb29ac2	f0ddedc4-0626-40a9-b37d-d7084797484a
35bf4270-3a4c-4caf-9241-b183b0a838fe	ff242237-9887-404e-98e4-d57f4a568a00
35bf4270-3a4c-4caf-9241-b183b0a838fe	09c46b4f-931f-44fd-b41f-6bb1fee7f887
748c182c-60f3-47cd-bcad-e836a4ae5090	2010040e-4eb5-418d-a8f9-a15b68d029e6
748c182c-60f3-47cd-bcad-e836a4ae5090	6af2680b-e78d-4393-8a2e-4d8fd4fbbce2
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
delegatorTypeOfIdentifier	NA_DK_VirksomhedSENummer	2f950c85-d521-482c-9df8-e458c1719b45	b44791af-5733-416a-9e0f-7245613ac750
delegatorTypeOfActor	EO	2f950c85-d521-482c-9df8-e458c1719b45	be504d89-b4fe-4abd-a364-c8c0b074848d
legalname	Mama Mia	2f950c85-d521-482c-9df8-e458c1719b45	61efde1d-f727-46c7-b09a-51306390e550
typeOfIdentifier	NA_DK_MedarbejderIdent	2f950c85-d521-482c-9df8-e458c1719b45	59c3147f-95e0-4d36-b2ec-8c040bb34d01
delegatorLegalname	Mama Mia	2f950c85-d521-482c-9df8-e458c1719b45	8bb33f5a-1ef5-4c51-a4d3-12046f83c288
delegatorAlternateIdentifierType	NA_DK_VirksomhedCVRNummer	2f950c85-d521-482c-9df8-e458c1719b45	893c97f2-12c8-4ac5-a2b7-0f5ba19ec123
delegatorTypeOfPerson	LP	2f950c85-d521-482c-9df8-e458c1719b45	8e1fcfa5-5a99-441b-be61-5c44745c9418
delegatorAlternateName	Mama Mia	2f950c85-d521-482c-9df8-e458c1719b45	3a16db26-7bb0-4e5e-959a-860636502641
countryCode	DK	2f950c85-d521-482c-9df8-e458c1719b45	9c3707f2-4eb2-4ec9-bf34-504979bd97ce
typeOfActor	EMPL	2f950c85-d521-482c-9df8-e458c1719b45	3d8cc0f0-c963-4891-ba5e-7464339d2965
eIdentifier	47083961	2f950c85-d521-482c-9df8-e458c1719b45	1adedd62-9f68-4455-8605-29b6bce1a3de
delegatorCountryCode	DK	2f950c85-d521-482c-9df8-e458c1719b45	029dcef5-b1d9-44cd-aab8-b6e649598d23
typeOfPerson	NP	2f950c85-d521-482c-9df8-e458c1719b45	ff16ab96-a4d0-463f-b72e-b32d0495ef4d
skatMedarbejderADNummer	W2000	6a94d423-1726-49c1-85c7-7ebb07c54cd5	b5ec47ab-7500-4412-9e4c-5824e726a7a4
skatMedarbejderADAfdelingKontor	Logbog	6a94d423-1726-49c1-85c7-7ebb07c54cd5	c6c248bc-6334-4102-b79d-36135ff0dc70
skatMedarbejderADNummer	2001	ddfbee3d-4d40-435a-a705-858ae8a187d2	9aca468e-47e6-418a-b1ed-8039e59f9ca8
skatMedarbejderADAfdelingKontor	Dupla	ddfbee3d-4d40-435a-a705-858ae8a187d2	98c922a7-7a59-4e17-b9bf-c88b42ee6969
skatMedarbejderADNummer	2002	f44eb987-d946-4275-b1b9-2b7cd4a26034	7c8d0958-e1a5-4a62-9557-32a4d992ca1e
skatMedarbejderADAfdelingKontor	Dupla	f44eb987-d946-4275-b1b9-2b7cd4a26034	33a97a64-1923-4f8f-a4eb-b1ac4f58fb50
delegatorAlternateIdentifier	90000001	2f950c85-d521-482c-9df8-e458c1719b45	64768365-8bbe-4c3c-9061-f65b5e6e28c3
delegatorIdentifier	90000001	2f950c85-d521-482c-9df8-e458c1719b45	79b2d749-1d81-4155-b1a8-b188c69a8597
skatMedarbejderADNummer	W34088	c2cbdc41-9f23-4346-a369-2afd70304956	fbd88221-bce3-45f1-a136-0de9743f326e
delegatorTypeOfIdentifier	NA_DK_VirksomhedSENummer	de68acd1-141e-470b-a81b-7ca70276086c	21e46b4e-4110-4e73-8e2b-fb64b3456fcc
delegatorTypeOfActor	EO	de68acd1-141e-470b-a81b-7ca70276086c	75a8b05e-7404-483f-bab1-fd95f0ffc0e1
legalname	John Doe	de68acd1-141e-470b-a81b-7ca70276086c	c1fdeadd-a8aa-479f-921d-4275cb773b10
typeOfIdentifier	NA_DK_MedarbejderIdent	de68acd1-141e-470b-a81b-7ca70276086c	bd550c44-fb23-4035-9386-cdd4df0d838f
delegatorLegalname	John Doe	de68acd1-141e-470b-a81b-7ca70276086c	ca9d4abe-ad1d-416b-b5bd-e45cea52ad76
delegatorAlternateIdentifierType	NA_DK_VirksomhedCVRNummer	de68acd1-141e-470b-a81b-7ca70276086c	5cdc75ea-9c50-4d58-a5c3-73c6ff815f62
delegatorTypeOfPerson	LP	de68acd1-141e-470b-a81b-7ca70276086c	bfa9cfcd-426d-4847-8dd4-aba5224d228e
delegatorAlternateName	John Doe	de68acd1-141e-470b-a81b-7ca70276086c	db52e3bf-40e2-4950-a92f-127138b0551f
countryCode	DK	de68acd1-141e-470b-a81b-7ca70276086c	c4810e66-506e-495b-8c22-588f21d8781c
delegatorAlternateIdentifier	19552101	de68acd1-141e-470b-a81b-7ca70276086c	a6d0b11f-70e2-4354-b3e4-87857706d01a
delegatorIdentifier	19552101	de68acd1-141e-470b-a81b-7ca70276086c	9472a39a-4a23-4fc4-a5b9-10d3f661d7e8
typeOfActor	EMPL	de68acd1-141e-470b-a81b-7ca70276086c	8cc21813-2799-4d84-9191-640492b39c66
eIdentifier	47083961	de68acd1-141e-470b-a81b-7ca70276086c	e0c9731c-caaa-404e-8cbe-193ca301d2b7
delegatorCountryCode	DK	de68acd1-141e-470b-a81b-7ca70276086c	373b7705-532f-464d-b4b2-df62b60c8c42
typeOfPerson	NP	de68acd1-141e-470b-a81b-7ca70276086c	7dc06959-71ea-4190-a93c-bcea071633f7
delegatorTypeOfIdentifier	NA_DK_VirksomhedSENummer	d0910d8b-cf45-403a-8339-2a3918135be7	135308bf-ec50-4988-80a5-bd1100db16f4
delegatorTypeOfActor	EO	d0910d8b-cf45-403a-8339-2a3918135be7	214fa8ce-ea9a-4877-819f-4c0c6946cf08
legalname	Joan Doe	d0910d8b-cf45-403a-8339-2a3918135be7	a7614b49-defb-4607-acad-3ad9ce3d2df7
typeOfIdentifier	NA_DK_MedarbejderIdent	d0910d8b-cf45-403a-8339-2a3918135be7	7542b0a8-39e8-4b2b-855e-1f3f083781c0
delegatorLegalname	Joan Doe	d0910d8b-cf45-403a-8339-2a3918135be7	c0ddd6dc-73b4-4bf7-9059-30cc8e54e6d6
delegatorAlternateIdentifierType	NA_DK_VirksomhedCVRNummer	d0910d8b-cf45-403a-8339-2a3918135be7	2bde2845-a025-4ada-b820-523699af750b
delegatorTypeOfPerson	LP	d0910d8b-cf45-403a-8339-2a3918135be7	24bfeede-b3ae-458c-bcd4-7f4dc48d8327
delegatorAlternateName	Joan Doe	d0910d8b-cf45-403a-8339-2a3918135be7	0b3c5aaa-6787-453c-8988-f06b1921b674
countryCode	DK	d0910d8b-cf45-403a-8339-2a3918135be7	d2789209-6f5d-4778-b64a-fc41a8d553d3
delegatorAlternateIdentifier	82050817	d0910d8b-cf45-403a-8339-2a3918135be7	4e08b112-58d2-4099-944a-1efaca9a7116
delegatorIdentifier	82050817	d0910d8b-cf45-403a-8339-2a3918135be7	cfe870cd-83d8-4c47-ae45-b579313d7602
typeOfActor	EMPL	d0910d8b-cf45-403a-8339-2a3918135be7	ab82311e-33b0-4cc5-8bad-85fc40c6d111
eIdentifier	47083961	d0910d8b-cf45-403a-8339-2a3918135be7	af170c86-832a-4796-bfed-74606e2a6944
delegatorCountryCode	DK	d0910d8b-cf45-403a-8339-2a3918135be7	4f36d89b-5f8b-473a-b59a-c9815b30d6a8
typeOfPerson	NP	d0910d8b-cf45-403a-8339-2a3918135be7	887a7d1c-dba9-4e1b-9187-9781ec5319b9
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
87c2b594-815a-4caf-bb29-53391f08e2ee	\N	fd83eba5-f62c-47de-9a5b-b9f562c62b79	f	t	\N	\N	\N	cb748a80-a440-40dc-ba38-53857fbff49b	admin	1700148723568	\N	0
c2cbdc41-9f23-4346-a369-2afd70304956	sikved@localkube.xx	sikved@localkube.xx	t	t	\N	Sikved Firstname	Sikved Lastname	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	sikved	1700149061351	\N	0
36cd9333-02ab-47eb-b4b1-28bbe5ec8612	tolder@toldkontrol.localkube.domain	tolder@toldkontrol.localkube.domain	t	t	\N	tolder	tolder	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	tolder	1700167028007	\N	0
43ae0e3b-7217-430f-b15a-71042d03da05	logbog-virksomhed@localkube.localhost	logbog-virksomhed@localkube.localhost	t	t	\N	Logbog	Virksomhed	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	logbog-virksomhed	1701691970112	\N	0
2f950c85-d521-482c-9df8-e458c1719b45	c10267900@dcs.localhost	c10267900@dcs.localhost	t	t	\N	Mama	Mia	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	c10267900	1701765308573	\N	0
b218fc6e-5a33-4efa-9d42-bd3834a27bc6	ligningslov@skat.dk	ligningslov@skat.dk	t	t	\N	Karl	Smart	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	ligningslov	1717066400558	\N	0
9b8f8a53-3cda-457f-958d-b2b475160167	toko@localtest.me	toko@localtest.me	t	t	\N	toko firstname	toko lastname	c3ee8ea6-caa2-48fa-95c4-679f16ec203a	toko	1718803674344	\N	0
f44eb987-d946-4275-b1b9-2b7cd4a26034	udstiller.underskiver@localtest.me	udstiller.underskiver@localtest.me	t	t	\N	Udstiller	Underskiver	e8cfaa41-db82-4979-8f75-429ff43b53b9	udstiller-underskiver	1719918553704	\N	0
ba0e7fc2-5b25-4f9c-8f5e-958fd53a831b	aftager.behandler@localtest.me	aftager.behandler@localtest.me	t	t	\N	Aftager	Behandler	e8cfaa41-db82-4979-8f75-429ff43b53b9	aftager-behandler	1719918630440	\N	0
a7f60154-c27c-4a87-829e-54ba175192bf	aftager.underskriver@localtest.me	aftager.underskriver@localtest.me	t	t	\N	Aftager	Underskiver	e8cfaa41-db82-4979-8f75-429ff43b53b9	aftager-underskriver	1719918678379	\N	0
ddfbee3d-4d40-435a-a705-858ae8a187d2	udstiller.behandler@localtest.me	udstiller.behandler@localtest.me	t	t	\N	Udstiller	Behandler	e8cfaa41-db82-4979-8f75-429ff43b53b9	udstiller-behandler	1719918590044	\N	0
6a94d423-1726-49c1-85c7-7ebb07c54cd5	w20@logbog.localhost	w20@logbog.localhost	t	t	\N	Arne	Hansen	e8cfaa41-db82-4979-8f75-429ff43b53b9	w2000	1701803643437	\N	0
de68acd1-141e-470b-a81b-7ca70276086c	skattekontoen-19552101@dcs.localhost	skattekontoen-19552101@dcs.localhost	t	t	\N	John	Doe	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	skattekontoen-19552101	1738750708176	\N	0
d0910d8b-cf45-403a-8339-2a3918135be7	skattekontoen-82050817@dcs.localhost	skattekontoen-82050817@dcs.localhost	t	t	\N	Joan	Doe	f54f9708-67b4-4beb-bd6f-e70aa9b00fe1	skattekontoen-82050817	1739178500396	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
cef67c5e-06bd-4d12-a43f-44f6c5946d38	c2cbdc41-9f23-4346-a369-2afd70304956
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
f245c712-a381-4ac4-bb2e-193e9a3ec9a6	87c2b594-815a-4caf-bb29-53391f08e2ee
9711d0eb-5a1f-4e71-b1af-cc5ad1201aa9	87c2b594-815a-4caf-bb29-53391f08e2ee
92e6eb9f-2ba4-433d-9a23-e080195a8195	87c2b594-815a-4caf-bb29-53391f08e2ee
0a631c11-8629-40c0-905c-745199883a13	87c2b594-815a-4caf-bb29-53391f08e2ee
05d66c65-8028-438c-90f7-fc172be4f9b8	87c2b594-815a-4caf-bb29-53391f08e2ee
6a6f5fde-a01c-46e9-b28b-2ee8264fdcb2	87c2b594-815a-4caf-bb29-53391f08e2ee
dee95d4c-f1d0-4725-92c1-2d3c9546bb72	87c2b594-815a-4caf-bb29-53391f08e2ee
de6dec9c-4563-4153-8b63-5d1e89b5df3b	87c2b594-815a-4caf-bb29-53391f08e2ee
7c6cdabc-4996-4b62-909b-ef4baae19a4d	87c2b594-815a-4caf-bb29-53391f08e2ee
11f6016e-c74c-4e05-9471-ef20800e5dbc	87c2b594-815a-4caf-bb29-53391f08e2ee
40f01fe2-8049-4e44-a2ab-d47b6e2e9b58	87c2b594-815a-4caf-bb29-53391f08e2ee
b912be96-99a6-424e-b6a8-3e8fec7709fb	87c2b594-815a-4caf-bb29-53391f08e2ee
ea1b8a08-fb79-419a-8bc6-4a2f83bda4b2	87c2b594-815a-4caf-bb29-53391f08e2ee
497d2e6f-188a-45bd-80d1-7a218453cde5	87c2b594-815a-4caf-bb29-53391f08e2ee
8d526b7c-c61f-4441-9019-18397563a6ed	87c2b594-815a-4caf-bb29-53391f08e2ee
b6b00af4-27d2-4b27-8d2d-c88ba6b88d45	87c2b594-815a-4caf-bb29-53391f08e2ee
f3ce16f3-ada5-4553-bdb3-881434f74012	87c2b594-815a-4caf-bb29-53391f08e2ee
8ac9e5b5-db2c-4215-a495-c1af7f8a2bbf	87c2b594-815a-4caf-bb29-53391f08e2ee
996a0a22-d936-4031-b861-dd5c21dfda2e	87c2b594-815a-4caf-bb29-53391f08e2ee
87f1ba85-55c3-4fd0-aded-2235a0979bcf	c2cbdc41-9f23-4346-a369-2afd70304956
87f1ba85-55c3-4fd0-aded-2235a0979bcf	36cd9333-02ab-47eb-b4b1-28bbe5ec8612
58c65169-8fe0-477c-a012-2f1d2f18072e	c2cbdc41-9f23-4346-a369-2afd70304956
87f1ba85-55c3-4fd0-aded-2235a0979bcf	43ae0e3b-7217-430f-b15a-71042d03da05
1e48f0ed-175a-47e1-9fad-364778cf9c30	87c2b594-815a-4caf-bb29-53391f08e2ee
4030b3c4-1d98-4372-8db4-78675a297124	87c2b594-815a-4caf-bb29-53391f08e2ee
18e9738c-3f42-45a3-adbb-6a29ac761bad	87c2b594-815a-4caf-bb29-53391f08e2ee
a55de2ff-a941-430e-9168-daa93dcfc864	87c2b594-815a-4caf-bb29-53391f08e2ee
b637c4a6-6f69-4d77-aaab-4941df2ca04d	87c2b594-815a-4caf-bb29-53391f08e2ee
80e88b8f-0b3c-4e57-85e6-514b01f93b26	87c2b594-815a-4caf-bb29-53391f08e2ee
29c6f6da-ced3-4c7f-a19c-81e76a0f984a	87c2b594-815a-4caf-bb29-53391f08e2ee
8823f58f-5fbf-412e-bd11-c94e0467c095	87c2b594-815a-4caf-bb29-53391f08e2ee
7239a397-b856-45c3-8426-c1d5ca194332	87c2b594-815a-4caf-bb29-53391f08e2ee
bf63ee79-228b-4cd8-a5f6-ac481d701672	87c2b594-815a-4caf-bb29-53391f08e2ee
a29987b3-aca3-4744-b413-2a7c3c5e8a3b	87c2b594-815a-4caf-bb29-53391f08e2ee
15c925a0-154d-4bc4-9c9a-2378813bfc12	87c2b594-815a-4caf-bb29-53391f08e2ee
c1800c56-4d88-4a03-9b85-ee9807728978	87c2b594-815a-4caf-bb29-53391f08e2ee
f2fa273d-dd77-470e-8b30-b209783c4d69	87c2b594-815a-4caf-bb29-53391f08e2ee
391621a5-370f-49ad-b185-13f59a618a0e	87c2b594-815a-4caf-bb29-53391f08e2ee
941f09c9-2d9a-4271-afaf-e77cfd389829	87c2b594-815a-4caf-bb29-53391f08e2ee
9c657277-4b98-4c74-8aa3-b887e3a4319e	87c2b594-815a-4caf-bb29-53391f08e2ee
65b905f9-d2a1-4a88-b361-780f85c5c0a7	2f950c85-d521-482c-9df8-e458c1719b45
010539b9-48f9-4086-9b0a-78c87085c7cb	2f950c85-d521-482c-9df8-e458c1719b45
25eb64b0-b39f-4120-9b22-5c7cc540089e	87c2b594-815a-4caf-bb29-53391f08e2ee
ea001888-d70c-4fce-bd92-5ec7c2121a8b	87c2b594-815a-4caf-bb29-53391f08e2ee
623f19b9-2836-4d8d-9542-1fd94f126e3f	87c2b594-815a-4caf-bb29-53391f08e2ee
44d2cec3-d190-4e7f-84c6-51b10130c55a	87c2b594-815a-4caf-bb29-53391f08e2ee
922640ca-9072-4285-b098-5e78e6742799	87c2b594-815a-4caf-bb29-53391f08e2ee
530481e3-5049-4df4-bcdb-0b6c7ff2c8c3	87c2b594-815a-4caf-bb29-53391f08e2ee
2b54e736-7516-47bf-9471-a40b1c0aad07	87c2b594-815a-4caf-bb29-53391f08e2ee
0e046bc4-e42e-4514-9d94-70096b0ac90f	87c2b594-815a-4caf-bb29-53391f08e2ee
4c05170e-2511-4a2f-b764-252d02003921	87c2b594-815a-4caf-bb29-53391f08e2ee
76f38b87-ac07-4453-be87-2aa0c52f3014	87c2b594-815a-4caf-bb29-53391f08e2ee
31654f2f-ffbc-48b2-ade1-acf5aa3c9d08	87c2b594-815a-4caf-bb29-53391f08e2ee
74b8cd49-dd54-4d5a-9ca7-c5629c7d79cc	87c2b594-815a-4caf-bb29-53391f08e2ee
17f5dd03-cbe6-4d13-b35f-2a387cb8a326	87c2b594-815a-4caf-bb29-53391f08e2ee
fad71b2d-abe4-47cd-a0f5-bcb58ec1e717	87c2b594-815a-4caf-bb29-53391f08e2ee
cd862773-9af1-4158-bdcf-82f75874ca60	87c2b594-815a-4caf-bb29-53391f08e2ee
19f59c90-3b21-4028-aefa-e85aed04d6a7	87c2b594-815a-4caf-bb29-53391f08e2ee
7c9c6b67-2b97-4af7-a916-eea1e6e84981	87c2b594-815a-4caf-bb29-53391f08e2ee
dcd95271-392e-4636-aa12-4aa46e20ef5e	6a94d423-1726-49c1-85c7-7ebb07c54cd5
7b7d5b6c-1032-4a5a-9fe2-102d056786cf	6a94d423-1726-49c1-85c7-7ebb07c54cd5
87f1ba85-55c3-4fd0-aded-2235a0979bcf	b218fc6e-5a33-4efa-9d42-bd3834a27bc6
87f1ba85-55c3-4fd0-aded-2235a0979bcf	9b8f8a53-3cda-457f-958d-b2b475160167
138a198b-4098-4129-b535-9ded7069d8ae	6a94d423-1726-49c1-85c7-7ebb07c54cd5
dcd95271-392e-4636-aa12-4aa46e20ef5e	f44eb987-d946-4275-b1b9-2b7cd4a26034
dcd95271-392e-4636-aa12-4aa46e20ef5e	ddfbee3d-4d40-435a-a705-858ae8a187d2
dcd95271-392e-4636-aa12-4aa46e20ef5e	ba0e7fc2-5b25-4f9c-8f5e-958fd53a831b
dcd95271-392e-4636-aa12-4aa46e20ef5e	a7f60154-c27c-4a87-829e-54ba175192bf
0943d7bd-2158-488c-af5d-01c1776146df	ba0e7fc2-5b25-4f9c-8f5e-958fd53a831b
083d0431-cea7-457a-add6-2ab47b887ccf	a7f60154-c27c-4a87-829e-54ba175192bf
138a198b-4098-4129-b535-9ded7069d8ae	ddfbee3d-4d40-435a-a705-858ae8a187d2
9a686133-a145-45aa-8863-f21a6a22c0b4	f44eb987-d946-4275-b1b9-2b7cd4a26034
17a7a0c4-5ce6-42c2-a827-f8f6ddabda05	6a94d423-1726-49c1-85c7-7ebb07c54cd5
9a686133-a145-45aa-8863-f21a6a22c0b4	6a94d423-1726-49c1-85c7-7ebb07c54cd5
0943d7bd-2158-488c-af5d-01c1776146df	6a94d423-1726-49c1-85c7-7ebb07c54cd5
083d0431-cea7-457a-add6-2ab47b887ccf	6a94d423-1726-49c1-85c7-7ebb07c54cd5
65b905f9-d2a1-4a88-b361-780f85c5c0a7	de68acd1-141e-470b-a81b-7ca70276086c
65b905f9-d2a1-4a88-b361-780f85c5c0a7	d0910d8b-cf45-403a-8339-2a3918135be7
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
7d83e93d-0083-4e82-994f-2da2b7a5ac46	+
c1a4b05c-5a99-4092-9593-2081bc7a1c30	+
41a1caef-08cf-47a5-80c0-98aff7ae2f33	http://localhost:8080
41a1caef-08cf-47a5-80c0-98aff7ae2f33	http://logbog-kontrol.localhost
41a1caef-08cf-47a5-80c0-98aff7ae2f33	http://logbog-virksomhed.localhost
12215ae6-3f08-4e58-b662-ff85df0effb1	+
b5858d86-6a83-43ba-a4b0-a0dd5e663059	+
4beaf17c-a463-4896-9314-a4b22bd894b5	/*
cfd98b3f-4b2e-4e74-8a69-fb9dbc13eb0a	/*
75b5a3c1-93e5-4e4d-a85f-8c3101dffd0f	http://ligningslov.localtest.me/*
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	https://logbog-virksomhed.localtest.me
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	http://localhost:8080
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	http://logbog-virksomhed.localtest.me
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	http://localhost:5011
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	http://localhost:5000
dfc4d0e1-4337-4aa9-8fa0-732577a1a654	http://logbog-virksomhed.localhost
a09f6280-72d4-41eb-8043-78a465df485b	https://toko.localtest.me
a09f6280-72d4-41eb-8043-78a465df485b	http://toko.localtest.me
3b60edca-5a67-4e90-b024-5f870858001b	*
6abdd522-ccc5-4de9-88eb-83c8366acdc2	https://logbog-kontrol.localtest.me
6abdd522-ccc5-4de9-88eb-83c8366acdc2	http://logbog-kontrol.localtest.me
6abdd522-ccc5-4de9-88eb-83c8366acdc2	http://localhost:5012/*
6abdd522-ccc5-4de9-88eb-83c8366acdc2	http://logbog-kontrol.localhost
6abdd522-ccc5-4de9-88eb-83c8366acdc2	http://localhost:5000
6abdd522-ccc5-4de9-88eb-83c8366acdc2	*
977c1cf5-951a-41d0-82d1-e78c0297d109	/*
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	https://toldkontrol-api.localtest.me/*
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	*
6e2f5a7a-283b-4af8-9197-01d778d4c6a7	https://toldkontrol-web.localtest.me/*
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

