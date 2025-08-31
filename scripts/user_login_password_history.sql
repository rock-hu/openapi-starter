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
-- Name: user_login_password_history; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE user_login_password_history (
    user_login_id character varying(255) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    current_password character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.user_login_password_history OWNER TO ofbiz;

--
-- Name: user_login_password_history pk_user_login_password_history; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_login_password_history
    ADD CONSTRAINT pk_user_login_password_history PRIMARY KEY (user_login_id, from_date);


--
-- Name: user_lph_user; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX user_lph_user ON user_login_password_history USING btree (user_login_id);


--
-- Name: usr_lgn_psd_hsr_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX usr_lgn_psd_hsr_tp ON user_login_password_history USING btree (last_updated_tx_stamp);


--
-- Name: usr_lgn_psd_hsr_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX usr_lgn_psd_hsr_ts ON user_login_password_history USING btree (created_tx_stamp);


--
-- Name: user_login_password_history user_lph_user; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_login_password_history
    ADD CONSTRAINT user_lph_user FOREIGN KEY (user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

