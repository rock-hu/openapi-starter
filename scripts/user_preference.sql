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
-- Name: user_preference; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE user_preference (
    user_login_id character varying(255) NOT NULL,
    user_pref_type_id character varying(60) NOT NULL,
    user_pref_group_type_id character varying(60),
    user_pref_value character varying(255),
    user_pref_data_type character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.user_preference OWNER TO ofbiz;

--
-- Name: user_preference pk_user_preference; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_preference
    ADD CONSTRAINT pk_user_preference PRIMARY KEY (user_login_id, user_pref_type_id);


--
-- Name: up_user_group_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX up_user_group_type ON user_preference USING btree (user_pref_group_type_id);


--
-- Name: usr_prfrnc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX usr_prfrnc_txcrts ON user_preference USING btree (created_tx_stamp);


--
-- Name: usr_prfrnc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX usr_prfrnc_txstmp ON user_preference USING btree (last_updated_tx_stamp);


--
-- Name: user_preference up_user_group_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_preference
    ADD CONSTRAINT up_user_group_type FOREIGN KEY (user_pref_group_type_id) REFERENCES user_pref_group_type(user_pref_group_type_id);


--
-- PostgreSQL database dump complete
--

