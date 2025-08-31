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
-- Name: work_effort_inventory_assign; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_inventory_assign (
    work_effort_id character varying(20) NOT NULL,
    inventory_item_id character varying(20) NOT NULL,
    status_id character varying(20),
    quantity double precision,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_inventory_assign OWNER TO ofbiz;

--
-- Name: work_effort_inventory_assign pk_work_effort_inventory_assig; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_inventory_assign
    ADD CONSTRAINT pk_work_effort_inventory_assig PRIMARY KEY (work_effort_id, inventory_item_id);


--
-- Name: wkeff_invas_invit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_invas_invit ON work_effort_inventory_assign USING btree (inventory_item_id);


--
-- Name: wkeff_invas_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_invas_stts ON work_effort_inventory_assign USING btree (status_id);


--
-- Name: wkeff_invas_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_invas_weff ON work_effort_inventory_assign USING btree (work_effort_id);


--
-- Name: wrk_eft_inr_asn_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_inr_asn_tp ON work_effort_inventory_assign USING btree (last_updated_tx_stamp);


--
-- Name: wrk_eft_inr_asn_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_inr_asn_ts ON work_effort_inventory_assign USING btree (created_tx_stamp);


--
-- Name: work_effort_inventory_assign wkeff_invas_invit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_inventory_assign
    ADD CONSTRAINT wkeff_invas_invit FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: work_effort_inventory_assign wkeff_invas_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_inventory_assign
    ADD CONSTRAINT wkeff_invas_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: work_effort_inventory_assign wkeff_invas_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_inventory_assign
    ADD CONSTRAINT wkeff_invas_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

