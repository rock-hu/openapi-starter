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
-- Name: product_config_stats; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_config_stats (
    config_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    num_of_confs numeric(20,0),
    config_type_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_config_stats OWNER TO ofbiz;

--
-- Name: product_config_stats pk_product_config_stats; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_stats
    ADD CONSTRAINT pk_product_config_stats PRIMARY KEY (config_id, product_id);


--
-- Name: prdt_cng_sts_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_cng_sts_txcrs ON product_config_stats USING btree (created_tx_stamp);


--
-- Name: prdt_cng_sts_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_cng_sts_txstp ON product_config_stats USING btree (last_updated_tx_stamp);


--
-- Name: prod_confs_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_confs_prod ON product_config_stats USING btree (product_id);


--
-- Name: product_config_stats prod_confs_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_stats
    ADD CONSTRAINT prod_confs_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

