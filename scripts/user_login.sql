--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: user_login; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE user_login (
    user_login_id character varying(255) NOT NULL,
    current_password character varying(255),
    password_hint character varying(255),
    is_system character(1),
    enabled character(1),
    has_logged_out character(1),
    require_password_change character(1),
    last_currency_uom character varying(20),
    last_locale character varying(10),
    last_time_zone character varying(60),
    disabled_date_time timestamp with time zone,
    successive_failed_logins numeric(20,0),
    external_auth_id character varying(255),
    user_ldap_dn character varying(255),
    disabled_by character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone,
    party_id character varying(20)
);


-- ALTER TABLE public.user_login OWNER TO ofbiz;

--
-- Name: user_login pk_user_login; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_login
    ADD CONSTRAINT pk_user_login PRIMARY KEY (user_login_id);


--
-- Name: user_login_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX user_login_txcrts ON user_login USING btree (created_tx_stamp);


--
-- Name: user_login_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX user_login_txstmp ON user_login USING btree (last_updated_tx_stamp);


--
-- Name: user_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX user_party ON user_login USING btree (party_id);


--
-- Name: user_login user_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_login
    ADD CONSTRAINT user_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

