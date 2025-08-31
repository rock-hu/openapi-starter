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
-- Name: inventory_item_label_appl; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE inventory_item_label_appl (
    inventory_item_id character varying(20) NOT NULL,
    inventory_item_label_type_id character varying(20) NOT NULL,
    inventory_item_label_id character varying(20),
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.inventory_item_label_appl OWNER TO ofbiz;

--
-- Name: inventory_item_label_appl pk_inventory_item_label_appl; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_label_appl
    ADD CONSTRAINT pk_inventory_item_label_appl PRIMARY KEY (inventory_item_id, inventory_item_label_type_id);


--
-- Name: inr_itm_lbl_apl_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inr_itm_lbl_apl_tp ON inventory_item_label_appl USING btree (last_updated_tx_stamp);


--
-- Name: inr_itm_lbl_apl_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inr_itm_lbl_apl_ts ON inventory_item_label_appl USING btree (created_tx_stamp);


--
-- Name: inv_itlap_item; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_itlap_item ON inventory_item_label_appl USING btree (inventory_item_id);


--
-- Name: inv_itlap_lab; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_itlap_lab ON inventory_item_label_appl USING btree (inventory_item_label_id);


--
-- Name: inv_itlap_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_itlap_type ON inventory_item_label_appl USING btree (inventory_item_label_type_id);


--
-- Name: inventory_item_label_appl inv_itlap_item; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_label_appl
    ADD CONSTRAINT inv_itlap_item FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: inventory_item_label_appl inv_itlap_lab; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_label_appl
    ADD CONSTRAINT inv_itlap_lab FOREIGN KEY (inventory_item_label_id) REFERENCES inventory_item_label(inventory_item_label_id);


--
-- Name: inventory_item_label_appl inv_itlap_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_label_appl
    ADD CONSTRAINT inv_itlap_type FOREIGN KEY (inventory_item_label_type_id) REFERENCES inventory_item_label_type(inventory_item_label_type_id);


--
-- PostgreSQL database dump complete
--

