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
-- Name: order_item_contact_mech; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_item_contact_mech (
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    contact_mech_purpose_type_id character varying(20) NOT NULL,
    contact_mech_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_item_contact_mech OWNER TO ofbiz;

--
-- Name: order_item_contact_mech pk_order_item_contact_mech; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_contact_mech
    ADD CONSTRAINT pk_order_item_contact_mech PRIMARY KEY (order_id, order_item_seq_id, contact_mech_purpose_type_id);


--
-- Name: order_itcm_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itcm_cmech ON order_item_contact_mech USING btree (contact_mech_id);


--
-- Name: order_itcm_cmpt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itcm_cmpt ON order_item_contact_mech USING btree (contact_mech_purpose_type_id);


--
-- Name: order_itcm_oitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itcm_oitm ON order_item_contact_mech USING btree (order_id, order_item_seq_id);


--
-- Name: orr_itm_cnt_mch_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_cnt_mch_tp ON order_item_contact_mech USING btree (last_updated_tx_stamp);


--
-- Name: orr_itm_cnt_mch_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_cnt_mch_ts ON order_item_contact_mech USING btree (created_tx_stamp);


--
-- Name: order_item_contact_mech order_itcm_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_contact_mech
    ADD CONSTRAINT order_itcm_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: order_item_contact_mech order_itcm_cmpt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_contact_mech
    ADD CONSTRAINT order_itcm_cmpt FOREIGN KEY (contact_mech_purpose_type_id) REFERENCES contact_mech_purpose_type(contact_mech_purpose_type_id);


--
-- Name: order_item_contact_mech order_itcm_oitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_contact_mech
    ADD CONSTRAINT order_itcm_oitm FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- PostgreSQL database dump complete
--

