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
-- Name: fixed_asset_meter; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fixed_asset_meter (
    fixed_asset_id character varying(20) NOT NULL,
    product_meter_type_id character varying(20) NOT NULL,
    reading_date timestamp with time zone NOT NULL,
    meter_value numeric(18,6),
    reading_reason_enum_id character varying(20),
    maint_hist_seq_id character varying(20),
    work_effort_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fixed_asset_meter OWNER TO ofbiz;

--
-- Name: fixed_asset_meter pk_fixed_asset_meter; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_meter
    ADD CONSTRAINT pk_fixed_asset_meter PRIMARY KEY (fixed_asset_id, product_meter_type_id, reading_date);


--
-- Name: fxd_ast_mtr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_mtr_txcrts ON fixed_asset_meter USING btree (created_tx_stamp);


--
-- Name: fxd_ast_mtr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_mtr_txstmp ON fixed_asset_meter USING btree (last_updated_tx_stamp);


--
-- Name: fxdastmtr_famnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxdastmtr_famnt ON fixed_asset_meter USING btree (fixed_asset_id, maint_hist_seq_id);


--
-- Name: fxdastmtr_pmtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxdastmtr_pmtyp ON fixed_asset_meter USING btree (product_meter_type_id);


--
-- Name: fixed_asset_meter fxdastmtr_famnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_meter
    ADD CONSTRAINT fxdastmtr_famnt FOREIGN KEY (fixed_asset_id, maint_hist_seq_id) REFERENCES fixed_asset_maint(fixed_asset_id, maint_hist_seq_id);


--
-- Name: fixed_asset_meter fxdastmtr_pmtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_meter
    ADD CONSTRAINT fxdastmtr_pmtyp FOREIGN KEY (product_meter_type_id) REFERENCES product_meter_type(product_meter_type_id);


--
-- PostgreSQL database dump complete
--

