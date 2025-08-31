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
-- Name: content_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE content_role (
    content_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.content_role OWNER TO ofbiz;

--
-- Name: content_role pk_content_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_role
    ADD CONSTRAINT pk_content_role PRIMARY KEY (content_id, party_id, role_type_id, from_date);


--
-- Name: cntnt_rl_cntnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_rl_cntnt ON content_role USING btree (content_id);


--
-- Name: cntnt_rl_ptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_rl_ptrl ON content_role USING btree (party_id, role_type_id);


--
-- Name: cntnt_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_rl_txcrts ON content_role USING btree (created_tx_stamp);


--
-- Name: cntnt_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_rl_txstmp ON content_role USING btree (last_updated_tx_stamp);


--
-- Name: content_role cntnt_rl_cntnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_role
    ADD CONSTRAINT cntnt_rl_cntnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: content_role cntnt_rl_ptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_role
    ADD CONSTRAINT cntnt_rl_ptrl FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

