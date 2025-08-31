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
-- Name: product_config_option; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_config_option (
    config_item_id character varying(20) NOT NULL,
    config_option_id character varying(20) NOT NULL,
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    config_option_name character varying(100),
    description character varying(255),
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_config_option OWNER TO ofbiz;

--
-- Name: product_config_option pk_product_config_option; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_option
    ADD CONSTRAINT pk_product_config_option PRIMARY KEY (config_item_id, config_option_id);


--
-- Name: prdt_cng_opn_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_cng_opn_txcrs ON product_config_option USING btree (created_tx_stamp);


--
-- Name: prdt_cng_opn_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_cng_opn_txstp ON product_config_option USING btree (last_updated_tx_stamp);


--
-- Name: prod_optn_item; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_optn_item ON product_config_option USING btree (config_item_id);


--
-- Name: product_config_option prod_optn_item; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_option
    ADD CONSTRAINT prod_optn_item FOREIGN KEY (config_item_id) REFERENCES product_config_item(config_item_id);


--
-- PostgreSQL database dump complete
--

