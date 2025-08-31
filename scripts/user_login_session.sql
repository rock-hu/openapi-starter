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
-- Name: user_login_session; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE user_login_session (
    user_login_id character varying(255) NOT NULL,
    saved_date timestamp with time zone,
    session_data text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.user_login_session OWNER TO ofbiz;

--
-- Name: user_login_session pk_user_login_session; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_login_session
    ADD CONSTRAINT pk_user_login_session PRIMARY KEY (user_login_id);


--
-- Name: user_session_user; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX user_session_user ON user_login_session USING btree (user_login_id);


--
-- Name: usr_lgn_ssn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX usr_lgn_ssn_txcrts ON user_login_session USING btree (created_tx_stamp);


--
-- Name: usr_lgn_ssn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX usr_lgn_ssn_txstmp ON user_login_session USING btree (last_updated_tx_stamp);


--
-- Name: user_login_session user_session_user; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_login_session
    ADD CONSTRAINT user_session_user FOREIGN KEY (user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

