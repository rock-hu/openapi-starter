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
-- Name: inventory_item_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE inventory_item_status (
    inventory_item_id character varying(20) NOT NULL,
    status_id character varying(20) NOT NULL,
    status_datetime timestamp with time zone NOT NULL,
    status_end_datetime timestamp with time zone,
    change_by_user_login_id character varying(255),
    owner_party_id character varying(20),
    product_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.inventory_item_status OWNER TO ofbiz;

--
-- Name: inventory_item_status pk_inventory_item_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_status
    ADD CONSTRAINT pk_inventory_item_status PRIMARY KEY (inventory_item_id, status_id, status_datetime);


--
-- Name: inv_item_stts_ii; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_stts_ii ON inventory_item_status USING btree (inventory_item_id);


--
-- Name: inv_item_stts_si; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_stts_si ON inventory_item_status USING btree (status_id);


--
-- Name: inv_item_stts_user; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_stts_user ON inventory_item_status USING btree (change_by_user_login_id);


--
-- Name: invr_itm_sts_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invr_itm_sts_txcrs ON inventory_item_status USING btree (created_tx_stamp);


--
-- Name: invr_itm_sts_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invr_itm_sts_txstp ON inventory_item_status USING btree (last_updated_tx_stamp);


--
-- Name: inventory_item_status inv_item_stts_ii; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_status
    ADD CONSTRAINT inv_item_stts_ii FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: inventory_item_status inv_item_stts_si; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_status
    ADD CONSTRAINT inv_item_stts_si FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: inventory_item_status inv_item_stts_user; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_status
    ADD CONSTRAINT inv_item_stts_user FOREIGN KEY (change_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

