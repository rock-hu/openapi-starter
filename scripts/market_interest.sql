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
-- Name: market_interest; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE market_interest (
    product_category_id character varying(20) NOT NULL,
    party_classification_group_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.market_interest OWNER TO ofbiz;

--
-- Name: market_interest pk_market_interest; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY market_interest
    ADD CONSTRAINT pk_market_interest PRIMARY KEY (product_category_id, party_classification_group_id, from_date);


--
-- Name: market_int_pcat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX market_int_pcat ON market_interest USING btree (product_category_id);


--
-- Name: market_int_pcgrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX market_int_pcgrp ON market_interest USING btree (party_classification_group_id);


--
-- Name: mrkt_intrst_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrkt_intrst_txcrts ON market_interest USING btree (created_tx_stamp);


--
-- Name: mrkt_intrst_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrkt_intrst_txstmp ON market_interest USING btree (last_updated_tx_stamp);


--
-- Name: market_interest market_int_pcat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY market_interest
    ADD CONSTRAINT market_int_pcat FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: market_interest market_int_pcgrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY market_interest
    ADD CONSTRAINT market_int_pcgrp FOREIGN KEY (party_classification_group_id) REFERENCES party_classification_group(party_classification_group_id);


--
-- PostgreSQL database dump complete
--

