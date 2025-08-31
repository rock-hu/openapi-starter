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
-- Name: fixed_asset_std_cost; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fixed_asset_std_cost (
    fixed_asset_id character varying(20) NOT NULL,
    fixed_asset_std_cost_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    amount_uom_id character varying(20),
    amount numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fixed_asset_std_cost OWNER TO ofbiz;

--
-- Name: fixed_asset_std_cost pk_fixed_asset_std_cost; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_std_cost
    ADD CONSTRAINT pk_fixed_asset_std_cost PRIMARY KEY (fixed_asset_id, fixed_asset_std_cost_type_id, from_date);


--
-- Name: fixastco_amcurr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixastco_amcurr ON fixed_asset_std_cost USING btree (amount_uom_id);


--
-- Name: fixastco_fixast; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixastco_fixast ON fixed_asset_std_cost USING btree (fixed_asset_id);


--
-- Name: fixastco_typcos; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixastco_typcos ON fixed_asset_std_cost USING btree (fixed_asset_std_cost_type_id);


--
-- Name: fxd_ast_std_cst_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_std_cst_tp ON fixed_asset_std_cost USING btree (last_updated_tx_stamp);


--
-- Name: fxd_ast_std_cst_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_std_cst_ts ON fixed_asset_std_cost USING btree (created_tx_stamp);


--
-- Name: fixed_asset_std_cost fixastco_amcurr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_std_cost
    ADD CONSTRAINT fixastco_amcurr FOREIGN KEY (amount_uom_id) REFERENCES uom(uom_id);


--
-- Name: fixed_asset_std_cost fixastco_fixast; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_std_cost
    ADD CONSTRAINT fixastco_fixast FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: fixed_asset_std_cost fixastco_typcos; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_std_cost
    ADD CONSTRAINT fixastco_typcos FOREIGN KEY (fixed_asset_std_cost_type_id) REFERENCES fixed_asset_std_cost_type(fixed_asset_std_cost_type_id);


--
-- PostgreSQL database dump complete
--

