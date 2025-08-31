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
-- Name: product_maint_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_maint_type (
    product_maint_type_id character varying(20) NOT NULL,
    description character varying(255),
    parent_type_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_maint_type OWNER TO ofbiz;

--
-- Name: product_maint_type pk_product_maint_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_maint_type
    ADD CONSTRAINT pk_product_maint_type PRIMARY KEY (product_maint_type_id);


--
-- Name: prdt_mnt_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_mnt_tp_txcrts ON product_maint_type USING btree (created_tx_stamp);


--
-- Name: prdt_mnt_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_mnt_tp_txstmp ON product_maint_type USING btree (last_updated_tx_stamp);


--
-- Name: prodmnt_type_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodmnt_type_par ON product_maint_type USING btree (parent_type_id);


--
-- Name: product_maint_type prodmnt_type_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_maint_type
    ADD CONSTRAINT prodmnt_type_par FOREIGN KEY (parent_type_id) REFERENCES product_maint_type(product_maint_type_id);


--
-- PostgreSQL database dump complete
--

