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
-- Name: cart_abandoned_line; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cart_abandoned_line (
    visit_id character varying(20) NOT NULL,
    cart_abandoned_line_seq_id character varying(20) NOT NULL,
    product_id character varying(20),
    prod_catalog_id character varying(20),
    quantity numeric(18,6),
    reserv_start timestamp with time zone,
    reserv_length numeric(18,6),
    reserv_persons numeric(18,6),
    unit_price numeric(18,2),
    reserv2nd_p_p_perc numeric(18,6),
    reserv_nth_p_p_perc numeric(18,6),
    config_id character varying(20),
    total_with_adjustments numeric(18,2),
    was_reserved character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cart_abandoned_line OWNER TO ofbiz;

--
-- Name: cart_abandoned_line pk_cart_abandoned_line; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cart_abandoned_line
    ADD CONSTRAINT pk_cart_abandoned_line PRIMARY KEY (visit_id, cart_abandoned_line_seq_id);


--
-- Name: cart_abln_prd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cart_abln_prd ON cart_abandoned_line USING btree (product_id);


--
-- Name: cart_abln_prdcat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cart_abln_prdcat ON cart_abandoned_line USING btree (prod_catalog_id);


--
-- Name: crt_abndd_ln_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX crt_abndd_ln_txcrs ON cart_abandoned_line USING btree (created_tx_stamp);


--
-- Name: crt_abndd_ln_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX crt_abndd_ln_txstp ON cart_abandoned_line USING btree (last_updated_tx_stamp);


--
-- Name: cart_abandoned_line cart_abln_prd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cart_abandoned_line
    ADD CONSTRAINT cart_abln_prd FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: cart_abandoned_line cart_abln_prdcat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cart_abandoned_line
    ADD CONSTRAINT cart_abln_prdcat FOREIGN KEY (prod_catalog_id) REFERENCES prod_catalog(prod_catalog_id);


--
-- PostgreSQL database dump complete
--

