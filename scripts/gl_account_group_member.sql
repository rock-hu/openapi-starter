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
-- Name: gl_account_group_member; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gl_account_group_member (
    gl_account_id character varying(20) NOT NULL,
    gl_account_group_type_id character varying(20) NOT NULL,
    gl_account_group_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gl_account_group_member OWNER TO ofbiz;

--
-- Name: gl_account_group_member pk_gl_account_group_member; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_group_member
    ADD CONSTRAINT pk_gl_account_group_member PRIMARY KEY (gl_account_id, gl_account_group_type_id);


--
-- Name: gl_act_grp_mmr_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_act_grp_mmr_txp ON gl_account_group_member USING btree (last_updated_tx_stamp);


--
-- Name: gl_act_grp_mmr_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_act_grp_mmr_txs ON gl_account_group_member USING btree (created_tx_stamp);


--
-- Name: glact_gpmbr_ac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glact_gpmbr_ac ON gl_account_group_member USING btree (gl_account_id);


--
-- Name: glact_gpmbr_gp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glact_gpmbr_gp ON gl_account_group_member USING btree (gl_account_group_id);


--
-- Name: glact_gpmbr_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glact_gpmbr_tp ON gl_account_group_member USING btree (gl_account_group_type_id);


--
-- Name: gl_account_group_member glact_gpmbr_ac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_group_member
    ADD CONSTRAINT glact_gpmbr_ac FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: gl_account_group_member glact_gpmbr_gp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_group_member
    ADD CONSTRAINT glact_gpmbr_gp FOREIGN KEY (gl_account_group_id) REFERENCES gl_account_group(gl_account_group_id);


--
-- Name: gl_account_group_member glact_gpmbr_tp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_group_member
    ADD CONSTRAINT glact_gpmbr_tp FOREIGN KEY (gl_account_group_type_id) REFERENCES gl_account_group_type(gl_account_group_type_id);


--
-- PostgreSQL database dump complete
--

