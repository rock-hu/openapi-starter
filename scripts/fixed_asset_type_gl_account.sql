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
-- Name: fixed_asset_type_gl_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fixed_asset_type_gl_account (
    fixed_asset_type_id character varying(20) NOT NULL,
    fixed_asset_id character varying(20) NOT NULL,
    organization_party_id character varying(20) NOT NULL,
    asset_gl_account_id character varying(20),
    acc_dep_gl_account_id character varying(20),
    dep_gl_account_id character varying(20),
    profit_gl_account_id character varying(20),
    loss_gl_account_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fixed_asset_type_gl_account OWNER TO ofbiz;

--
-- Name: fixed_asset_type_gl_account pk_fixed_asset_type_gl_account; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_type_gl_account
    ADD CONSTRAINT pk_fixed_asset_type_gl_account PRIMARY KEY (fixed_asset_type_id, fixed_asset_id, organization_party_id);


--
-- Name: fatgl_accdgl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fatgl_accdgl ON fixed_asset_type_gl_account USING btree (acc_dep_gl_account_id);


--
-- Name: fatgl_agl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fatgl_agl ON fixed_asset_type_gl_account USING btree (asset_gl_account_id);


--
-- Name: fatgl_dgl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fatgl_dgl ON fixed_asset_type_gl_account USING btree (dep_gl_account_id);


--
-- Name: fatgl_lgl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fatgl_lgl ON fixed_asset_type_gl_account USING btree (loss_gl_account_id);


--
-- Name: fatgl_op; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fatgl_op ON fixed_asset_type_gl_account USING btree (organization_party_id);


--
-- Name: fatgl_pgl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fatgl_pgl ON fixed_asset_type_gl_account USING btree (profit_gl_account_id);


--
-- Name: fxd_tp_gl_act_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_tp_gl_act_tp ON fixed_asset_type_gl_account USING btree (last_updated_tx_stamp);


--
-- Name: fxd_tp_gl_act_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_tp_gl_act_ts ON fixed_asset_type_gl_account USING btree (created_tx_stamp);


--
-- Name: fixed_asset_type_gl_account fatgl_accdgl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_type_gl_account
    ADD CONSTRAINT fatgl_accdgl FOREIGN KEY (acc_dep_gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: fixed_asset_type_gl_account fatgl_agl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_type_gl_account
    ADD CONSTRAINT fatgl_agl FOREIGN KEY (asset_gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: fixed_asset_type_gl_account fatgl_dgl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_type_gl_account
    ADD CONSTRAINT fatgl_dgl FOREIGN KEY (dep_gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: fixed_asset_type_gl_account fatgl_lgl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_type_gl_account
    ADD CONSTRAINT fatgl_lgl FOREIGN KEY (loss_gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: fixed_asset_type_gl_account fatgl_op; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_type_gl_account
    ADD CONSTRAINT fatgl_op FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- Name: fixed_asset_type_gl_account fatgl_pgl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_type_gl_account
    ADD CONSTRAINT fatgl_pgl FOREIGN KEY (profit_gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- PostgreSQL database dump complete
--

