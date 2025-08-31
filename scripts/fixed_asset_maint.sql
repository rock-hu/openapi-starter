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
-- Name: fixed_asset_maint; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fixed_asset_maint (
    fixed_asset_id character varying(20) NOT NULL,
    maint_hist_seq_id character varying(20) NOT NULL,
    status_id character varying(20),
    product_maint_type_id character varying(20),
    product_maint_seq_id character varying(20),
    schedule_work_effort_id character varying(20),
    interval_quantity numeric(18,6),
    interval_uom_id character varying(20),
    interval_meter_type_id character varying(20),
    purchase_order_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fixed_asset_maint OWNER TO ofbiz;

--
-- Name: fixed_asset_maint pk_fixed_asset_maint; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_maint
    ADD CONSTRAINT pk_fixed_asset_maint PRIMARY KEY (fixed_asset_id, maint_hist_seq_id);


--
-- Name: fxd_ast_mnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_mnt_txcrts ON fixed_asset_maint USING btree (created_tx_stamp);


--
-- Name: fxd_ast_mnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_mnt_txstmp ON fixed_asset_maint USING btree (last_updated_tx_stamp);


--
-- Name: fxdastmnt_fxast; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxdastmnt_fxast ON fixed_asset_maint USING btree (fixed_asset_id);


--
-- Name: fxdastmnt_intuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxdastmnt_intuom ON fixed_asset_maint USING btree (interval_uom_id);


--
-- Name: fxdastmnt_pdmttyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxdastmnt_pdmttyp ON fixed_asset_maint USING btree (interval_meter_type_id);


--
-- Name: fxdastmnt_pmntp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxdastmnt_pmntp ON fixed_asset_maint USING btree (product_maint_type_id);


--
-- Name: fxdastmnt_purord; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxdastmnt_purord ON fixed_asset_maint USING btree (purchase_order_id);


--
-- Name: fxdastmnt_schwe; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxdastmnt_schwe ON fixed_asset_maint USING btree (schedule_work_effort_id);


--
-- Name: fxdastmnt_si; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxdastmnt_si ON fixed_asset_maint USING btree (status_id);


--
-- Name: fixed_asset_maint fxdastmnt_fxast; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_maint
    ADD CONSTRAINT fxdastmnt_fxast FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: fixed_asset_maint fxdastmnt_intuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_maint
    ADD CONSTRAINT fxdastmnt_intuom FOREIGN KEY (interval_uom_id) REFERENCES uom(uom_id);


--
-- Name: fixed_asset_maint fxdastmnt_pdmttyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_maint
    ADD CONSTRAINT fxdastmnt_pdmttyp FOREIGN KEY (interval_meter_type_id) REFERENCES product_meter_type(product_meter_type_id);


--
-- Name: fixed_asset_maint fxdastmnt_pmntp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_maint
    ADD CONSTRAINT fxdastmnt_pmntp FOREIGN KEY (product_maint_type_id) REFERENCES product_maint_type(product_maint_type_id);


--
-- Name: fixed_asset_maint fxdastmnt_purord; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_maint
    ADD CONSTRAINT fxdastmnt_purord FOREIGN KEY (purchase_order_id) REFERENCES order_header(order_id);


--
-- Name: fixed_asset_maint fxdastmnt_schwe; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_maint
    ADD CONSTRAINT fxdastmnt_schwe FOREIGN KEY (schedule_work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- Name: fixed_asset_maint fxdastmnt_si; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_maint
    ADD CONSTRAINT fxdastmnt_si FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

