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
-- Name: fixed_asset_ident; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fixed_asset_ident (
    fixed_asset_id character varying(20) NOT NULL,
    fixed_asset_ident_type_id character varying(20) NOT NULL,
    id_value character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fixed_asset_ident OWNER TO ofbiz;

--
-- Name: fixed_asset_ident pk_fixed_asset_ident; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_ident
    ADD CONSTRAINT pk_fixed_asset_ident PRIMARY KEY (fixed_asset_id, fixed_asset_ident_type_id);


--
-- Name: fixdastid_fxast; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixdastid_fxast ON fixed_asset_ident USING btree (fixed_asset_id);


--
-- Name: fixdastid_idtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixdastid_idtyp ON fixed_asset_ident USING btree (fixed_asset_ident_type_id);


--
-- Name: fxd_ast_idt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_idt_txcrts ON fixed_asset_ident USING btree (created_tx_stamp);


--
-- Name: fxd_ast_idt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_idt_txstmp ON fixed_asset_ident USING btree (last_updated_tx_stamp);


--
-- Name: fixed_asset_ident fixdastid_fxast; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_ident
    ADD CONSTRAINT fixdastid_fxast FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: fixed_asset_ident fixdastid_idtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_ident
    ADD CONSTRAINT fixdastid_idtyp FOREIGN KEY (fixed_asset_ident_type_id) REFERENCES fixed_asset_ident_type(fixed_asset_ident_type_id);


--
-- PostgreSQL database dump complete
--

