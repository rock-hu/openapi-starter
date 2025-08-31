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
-- Name: product_config_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_config_item (
    config_item_id character varying(20) NOT NULL,
    config_item_type_id character varying(20),
    config_item_name character varying(100),
    description character varying(255),
    long_description text,
    image_url character varying(2000),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_config_item OWNER TO ofbiz;

--
-- Name: product_config_item pk_product_config_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_item
    ADD CONSTRAINT pk_product_config_item PRIMARY KEY (config_item_id);


--
-- Name: prdt_cng_itm_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_cng_itm_txcrs ON product_config_item USING btree (created_tx_stamp);


--
-- Name: prdt_cng_itm_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_cng_itm_txstp ON product_config_item USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

