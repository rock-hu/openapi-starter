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
-- Name: web_user_preference; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE web_user_preference (
    user_login_id character varying(255) NOT NULL,
    party_id character varying(20) NOT NULL,
    visit_id character varying(20) NOT NULL,
    web_preference_type_id character varying(20) NOT NULL,
    web_preference_value character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.web_user_preference OWNER TO ofbiz;

--
-- Name: web_user_preference pk_web_user_preference; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_user_preference
    ADD CONSTRAINT pk_web_user_preference PRIMARY KEY (user_login_id, party_id, visit_id, web_preference_type_id);


--
-- Name: wb_usr_prfrc_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_usr_prfrc_txcrs ON web_user_preference USING btree (created_tx_stamp);


--
-- Name: wb_usr_prfrc_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_usr_prfrc_txstp ON web_user_preference USING btree (last_updated_tx_stamp);


--
-- Name: web_pref_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX web_pref_party ON web_user_preference USING btree (party_id);


--
-- Name: web_pref_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX web_pref_type ON web_user_preference USING btree (web_preference_type_id);


--
-- Name: web_pref_user; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX web_pref_user ON web_user_preference USING btree (user_login_id);


--
-- Name: web_user_preference web_pref_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_user_preference
    ADD CONSTRAINT web_pref_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: web_user_preference web_pref_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_user_preference
    ADD CONSTRAINT web_pref_type FOREIGN KEY (web_preference_type_id) REFERENCES web_preference_type(web_preference_type_id);


--
-- Name: web_user_preference web_pref_user; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_user_preference
    ADD CONSTRAINT web_pref_user FOREIGN KEY (user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

