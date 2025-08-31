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
-- Name: product_store_group_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_group_type (
    product_store_group_type_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_group_type OWNER TO ofbiz;

--
-- Name: product_store_group_type pk_product_store_group_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_group_type
    ADD CONSTRAINT pk_product_store_group_type PRIMARY KEY (product_store_group_type_id);


--
-- Name: prt_str_grp_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_grp_tp_txp ON product_store_group_type USING btree (last_updated_tx_stamp);


--
-- Name: prt_str_grp_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_grp_tp_txs ON product_store_group_type USING btree (created_tx_stamp);


--
-- PostgreSQL database dump complete
--

