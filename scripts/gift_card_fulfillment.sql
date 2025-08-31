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
-- Name: gift_card_fulfillment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gift_card_fulfillment (
    fulfillment_id character varying(20) NOT NULL,
    type_enum_id character varying(20),
    merchant_id character varying(255),
    party_id character varying(20),
    order_id character varying(20),
    order_item_seq_id character varying(20),
    survey_response_id character varying(20),
    card_number character varying(255),
    pin_number character varying(255),
    amount numeric(18,2),
    response_code character varying(60),
    reference_num character varying(60),
    auth_code character varying(60),
    fulfillment_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gift_card_fulfillment OWNER TO ofbiz;

--
-- Name: gift_card_fulfillment pk_gift_card_fulfillment; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gift_card_fulfillment
    ADD CONSTRAINT pk_gift_card_fulfillment PRIMARY KEY (fulfillment_id);


--
-- Name: gc_fill_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gc_fill_enum ON gift_card_fulfillment USING btree (type_enum_id);


--
-- Name: gc_fill_odrh; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gc_fill_odrh ON gift_card_fulfillment USING btree (order_id);


--
-- Name: gc_fill_odri; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gc_fill_odri ON gift_card_fulfillment USING btree (order_id, order_item_seq_id);


--
-- Name: gc_fill_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gc_fill_party ON gift_card_fulfillment USING btree (party_id);


--
-- Name: gc_fill_survy; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gc_fill_survy ON gift_card_fulfillment USING btree (survey_response_id);


--
-- Name: gft_crd_flflt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gft_crd_flflt_txcs ON gift_card_fulfillment USING btree (created_tx_stamp);


--
-- Name: gft_crd_flflt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gft_crd_flflt_txsp ON gift_card_fulfillment USING btree (last_updated_tx_stamp);


--
-- Name: gift_card_fulfillment gc_fill_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gift_card_fulfillment
    ADD CONSTRAINT gc_fill_enum FOREIGN KEY (type_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: gift_card_fulfillment gc_fill_odrh; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gift_card_fulfillment
    ADD CONSTRAINT gc_fill_odrh FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: gift_card_fulfillment gc_fill_odri; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gift_card_fulfillment
    ADD CONSTRAINT gc_fill_odri FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: gift_card_fulfillment gc_fill_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gift_card_fulfillment
    ADD CONSTRAINT gc_fill_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: gift_card_fulfillment gc_fill_survy; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gift_card_fulfillment
    ADD CONSTRAINT gc_fill_survy FOREIGN KEY (survey_response_id) REFERENCES survey_response(survey_response_id);


--
-- PostgreSQL database dump complete
--

