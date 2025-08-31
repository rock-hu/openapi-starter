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
-- Name: inventory_transfer; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE inventory_transfer (
    inventory_transfer_id character varying(20) NOT NULL,
    status_id character varying(20),
    inventory_item_id character varying(20),
    facility_id character varying(20),
    location_seq_id character varying(20),
    container_id character varying(20),
    facility_id_to character varying(20),
    location_seq_id_to character varying(20),
    container_id_to character varying(20),
    item_issuance_id character varying(20),
    send_date timestamp with time zone,
    receive_date timestamp with time zone,
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.inventory_transfer OWNER TO ofbiz;

--
-- Name: inventory_transfer pk_inventory_transfer; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_transfer
    ADD CONSTRAINT pk_inventory_transfer PRIMARY KEY (inventory_transfer_id);


--
-- Name: inv_xfer_cont; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_xfer_cont ON inventory_transfer USING btree (container_id);


--
-- Name: inv_xfer_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_xfer_fac ON inventory_transfer USING btree (facility_id);


--
-- Name: inv_xfer_issu; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_xfer_issu ON inventory_transfer USING btree (item_issuance_id);


--
-- Name: inv_xfer_item; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_xfer_item ON inventory_transfer USING btree (inventory_item_id);


--
-- Name: inv_xfer_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_xfer_stts ON inventory_transfer USING btree (status_id);


--
-- Name: inv_xfer_tcnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_xfer_tcnt ON inventory_transfer USING btree (container_id_to);


--
-- Name: inv_xfer_tfac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_xfer_tfac ON inventory_transfer USING btree (facility_id_to);


--
-- Name: invnr_trnsr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invnr_trnsr_txcrts ON inventory_transfer USING btree (created_tx_stamp);


--
-- Name: invnr_trnsr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invnr_trnsr_txstmp ON inventory_transfer USING btree (last_updated_tx_stamp);


--
-- Name: inventory_transfer inv_xfer_cont; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_transfer
    ADD CONSTRAINT inv_xfer_cont FOREIGN KEY (container_id) REFERENCES container(container_id);


--
-- Name: inventory_transfer inv_xfer_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_transfer
    ADD CONSTRAINT inv_xfer_fac FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: inventory_transfer inv_xfer_issu; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_transfer
    ADD CONSTRAINT inv_xfer_issu FOREIGN KEY (item_issuance_id) REFERENCES item_issuance(item_issuance_id);


--
-- Name: inventory_transfer inv_xfer_item; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_transfer
    ADD CONSTRAINT inv_xfer_item FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: inventory_transfer inv_xfer_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_transfer
    ADD CONSTRAINT inv_xfer_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: inventory_transfer inv_xfer_tcnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_transfer
    ADD CONSTRAINT inv_xfer_tcnt FOREIGN KEY (container_id_to) REFERENCES container(container_id);


--
-- Name: inventory_transfer inv_xfer_tfac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_transfer
    ADD CONSTRAINT inv_xfer_tfac FOREIGN KEY (facility_id_to) REFERENCES facility(facility_id);


--
-- PostgreSQL database dump complete
--

