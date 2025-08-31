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
-- Name: party_fixed_asset_assignment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_fixed_asset_assignment (
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    fixed_asset_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    allocated_date timestamp with time zone,
    status_id character varying(20),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_fixed_asset_assignment OWNER TO ofbiz;

--
-- Name: party_fixed_asset_assignment pk_party_fixed_asset_assignmen; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_fixed_asset_assignment
    ADD CONSTRAINT pk_party_fixed_asset_assignmen PRIMARY KEY (party_id, role_type_id, fixed_asset_id, from_date);


--
-- Name: prt_fxd_ast_ast_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_fxd_ast_ast_tp ON party_fixed_asset_assignment USING btree (last_updated_tx_stamp);


--
-- Name: prt_fxd_ast_ast_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_fxd_ast_ast_ts ON party_fixed_asset_assignment USING btree (created_tx_stamp);


--
-- Name: pty_fastas_fa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pty_fastas_fa ON party_fixed_asset_assignment USING btree (fixed_asset_id);


--
-- Name: pty_fastas_ptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pty_fastas_ptrl ON party_fixed_asset_assignment USING btree (party_id, role_type_id);


--
-- Name: pty_fastas_si; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pty_fastas_si ON party_fixed_asset_assignment USING btree (status_id);


--
-- Name: party_fixed_asset_assignment pty_fastas_fa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_fixed_asset_assignment
    ADD CONSTRAINT pty_fastas_fa FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: party_fixed_asset_assignment pty_fastas_ptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_fixed_asset_assignment
    ADD CONSTRAINT pty_fastas_ptrl FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: party_fixed_asset_assignment pty_fastas_si; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_fixed_asset_assignment
    ADD CONSTRAINT pty_fastas_si FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

