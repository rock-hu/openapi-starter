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
-- Name: product_config; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_config (
    product_id character varying(20) NOT NULL,
    config_item_id character varying(20) NOT NULL,
    sequence_num numeric(20,0) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    description character varying(255),
    long_description text,
    config_type_id character varying(20),
    default_config_option_id character varying(20),
    thru_date timestamp with time zone,
    is_mandatory character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_config OWNER TO ofbiz;

--
-- Name: product_config pk_product_config; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config
    ADD CONSTRAINT pk_product_config PRIMARY KEY (product_id, config_item_id, sequence_num, from_date);


--
-- Name: prdct_cnfg_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_cnfg_txcrts ON product_config USING btree (created_tx_stamp);


--
-- Name: prdct_cnfg_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_cnfg_txstmp ON product_config USING btree (last_updated_tx_stamp);


--
-- Name: prod_conf_item; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_conf_item ON product_config USING btree (config_item_id);


--
-- Name: prod_conf_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_conf_prod ON product_config USING btree (product_id);


--
-- Name: product_config prod_conf_item; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config
    ADD CONSTRAINT prod_conf_item FOREIGN KEY (config_item_id) REFERENCES product_config_item(config_item_id);


--
-- Name: product_config prod_conf_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config
    ADD CONSTRAINT prod_conf_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

