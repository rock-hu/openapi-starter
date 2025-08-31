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
-- Name: inventory_item_variance; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE inventory_item_variance (
    inventory_item_id character varying(20) NOT NULL,
    physical_inventory_id character varying(20) NOT NULL,
    variance_reason_id character varying(20),
    available_to_promise_var numeric(18,6),
    quantity_on_hand_var numeric(18,6),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.inventory_item_variance OWNER TO ofbiz;

--
-- Name: inventory_item_variance pk_inventory_item_variance; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_variance
    ADD CONSTRAINT pk_inventory_item_variance PRIMARY KEY (inventory_item_id, physical_inventory_id);


--
-- Name: inv_item_var_item; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_var_item ON inventory_item_variance USING btree (inventory_item_id);


--
-- Name: inv_item_var_pinv; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_var_pinv ON inventory_item_variance USING btree (physical_inventory_id);


--
-- Name: inv_item_var_rsn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_var_rsn ON inventory_item_variance USING btree (variance_reason_id);


--
-- Name: invr_itm_vrc_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invr_itm_vrc_txcrs ON inventory_item_variance USING btree (created_tx_stamp);


--
-- Name: invr_itm_vrc_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invr_itm_vrc_txstp ON inventory_item_variance USING btree (last_updated_tx_stamp);


--
-- Name: inventory_item_variance inv_item_var_item; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_variance
    ADD CONSTRAINT inv_item_var_item FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: inventory_item_variance inv_item_var_pinv; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_variance
    ADD CONSTRAINT inv_item_var_pinv FOREIGN KEY (physical_inventory_id) REFERENCES physical_inventory(physical_inventory_id);


--
-- Name: inventory_item_variance inv_item_var_rsn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_variance
    ADD CONSTRAINT inv_item_var_rsn FOREIGN KEY (variance_reason_id) REFERENCES variance_reason(variance_reason_id);


--
-- PostgreSQL database dump complete
--

