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
-- Name: config_option_product_option; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE config_option_product_option (
    config_id character varying(20) NOT NULL,
    config_item_id character varying(20) NOT NULL,
    sequence_num numeric(20,0) NOT NULL,
    config_option_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    product_option_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.config_option_product_option OWNER TO ofbiz;

--
-- Name: config_option_product_option pk_config_option_product_optio; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY config_option_product_option
    ADD CONSTRAINT pk_config_option_product_optio PRIMARY KEY (config_id, config_item_id, config_option_id, sequence_num, product_id);


--
-- Name: cng_opn_prt_opn_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cng_opn_prt_opn_tp ON config_option_product_option USING btree (last_updated_tx_stamp);


--
-- Name: cng_opn_prt_opn_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cng_opn_prt_opn_ts ON config_option_product_option USING btree (created_tx_stamp);


--
-- Name: prod_optn_conf; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_optn_conf ON config_option_product_option USING btree (config_id, config_item_id, config_option_id, sequence_num);


--
-- Name: prod_optn_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_optn_prod ON config_option_product_option USING btree (config_item_id, config_option_id, product_id);


--
-- Name: config_option_product_option prod_optn_conf; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY config_option_product_option
    ADD CONSTRAINT prod_optn_conf FOREIGN KEY (config_id, config_item_id, config_option_id, sequence_num) REFERENCES product_config_config(config_id, config_item_id, config_option_id, sequence_num);


--
-- Name: config_option_product_option prod_optn_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY config_option_product_option
    ADD CONSTRAINT prod_optn_prod FOREIGN KEY (config_item_id, config_option_id, product_id) REFERENCES product_config_product(config_item_id, config_option_id, product_id);


--
-- PostgreSQL database dump complete
--

