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
-- Name: product_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_type (
    product_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    is_physical character(1),
    is_digital character(1),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_type OWNER TO ofbiz;

--
-- Name: product_type pk_product_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_type
    ADD CONSTRAINT pk_product_type PRIMARY KEY (product_type_id);


--
-- Name: prdct_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_tp_txcrts ON product_type USING btree (created_tx_stamp);


--
-- Name: prdct_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_tp_txstmp ON product_type USING btree (last_updated_tx_stamp);


--
-- Name: prod_type_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_type_parent ON product_type USING btree (parent_type_id);


--
-- Name: product_type prod_type_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_type
    ADD CONSTRAINT prod_type_parent FOREIGN KEY (parent_type_id) REFERENCES product_type(product_type_id);


--
-- PostgreSQL database dump complete
--

