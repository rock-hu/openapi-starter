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
-- Name: gift_card; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gift_card (
    payment_method_id character varying(20) NOT NULL,
    card_number character varying(255),
    pin_number character varying(255),
    expire_date character varying(7),
    contact_mech_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gift_card OWNER TO ofbiz;

--
-- Name: gift_card pk_gift_card; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gift_card
    ADD CONSTRAINT pk_gift_card PRIMARY KEY (payment_method_id);


--
-- Name: gift_card_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gift_card_txcrts ON gift_card USING btree (created_tx_stamp);


--
-- Name: gift_card_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gift_card_txstmp ON gift_card USING btree (last_updated_tx_stamp);


--
-- Name: giftcard_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX giftcard_cmech ON gift_card USING btree (contact_mech_id);


--
-- Name: giftcard_paddr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX giftcard_paddr ON gift_card USING btree (contact_mech_id);


--
-- Name: giftcard_pmntmeth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX giftcard_pmntmeth ON gift_card USING btree (payment_method_id);


--
-- Name: gift_card giftcard_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gift_card
    ADD CONSTRAINT giftcard_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: gift_card giftcard_paddr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gift_card
    ADD CONSTRAINT giftcard_paddr FOREIGN KEY (contact_mech_id) REFERENCES postal_address(contact_mech_id);


--
-- Name: gift_card giftcard_pmntmeth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gift_card
    ADD CONSTRAINT giftcard_pmntmeth FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id);


--
-- PostgreSQL database dump complete
--

