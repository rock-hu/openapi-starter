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
-- Name: order_summary_entry; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_summary_entry (
    entry_date date NOT NULL,
    product_id character varying(20) NOT NULL,
    facility_id character varying(20) NOT NULL,
    total_quantity numeric(18,6),
    gross_sales numeric(18,2),
    product_cost numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_summary_entry OWNER TO ofbiz;

--
-- Name: order_summary_entry pk_order_summary_entry; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_summary_entry
    ADD CONSTRAINT pk_order_summary_entry PRIMARY KEY (entry_date, product_id, facility_id);


--
-- Name: order_sment_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_sment_fac ON order_summary_entry USING btree (facility_id);


--
-- Name: order_sment_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_sment_prod ON order_summary_entry USING btree (product_id);


--
-- Name: orr_smr_enr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_smr_enr_txcrts ON order_summary_entry USING btree (created_tx_stamp);


--
-- Name: orr_smr_enr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_smr_enr_txstmp ON order_summary_entry USING btree (last_updated_tx_stamp);


--
-- Name: order_summary_entry order_sment_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_summary_entry
    ADD CONSTRAINT order_sment_fac FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: order_summary_entry order_sment_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_summary_entry
    ADD CONSTRAINT order_sment_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

