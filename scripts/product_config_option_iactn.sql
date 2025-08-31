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
-- Name: product_config_option_iactn; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_config_option_iactn (
    config_item_id character varying(20) NOT NULL,
    config_option_id character varying(20) NOT NULL,
    config_item_id_to character varying(20) NOT NULL,
    config_option_id_to character varying(20) NOT NULL,
    sequence_num numeric(20,0) NOT NULL,
    config_iactn_type_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_config_option_iactn OWNER TO ofbiz;

--
-- Name: product_config_option_iactn pk_product_config_option_iactn; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_option_iactn
    ADD CONSTRAINT pk_product_config_option_iactn PRIMARY KEY (config_item_id, config_option_id, config_item_id_to, config_option_id_to, sequence_num);


--
-- Name: prod_optia_item; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_optia_item ON product_config_option_iactn USING btree (config_item_id);


--
-- Name: prod_optia_itmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_optia_itmt ON product_config_option_iactn USING btree (config_item_id_to);


--
-- Name: prod_optia_optn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_optia_optn ON product_config_option_iactn USING btree (config_item_id, config_option_id);


--
-- Name: prod_optia_optt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_optia_optt ON product_config_option_iactn USING btree (config_item_id_to, config_option_id_to);


--
-- Name: prt_cng_opn_icn_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_cng_opn_icn_tp ON product_config_option_iactn USING btree (last_updated_tx_stamp);


--
-- Name: prt_cng_opn_icn_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_cng_opn_icn_ts ON product_config_option_iactn USING btree (created_tx_stamp);


--
-- Name: product_config_option_iactn prod_optia_item; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_option_iactn
    ADD CONSTRAINT prod_optia_item FOREIGN KEY (config_item_id) REFERENCES product_config_item(config_item_id);


--
-- Name: product_config_option_iactn prod_optia_itmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_option_iactn
    ADD CONSTRAINT prod_optia_itmt FOREIGN KEY (config_item_id_to) REFERENCES product_config_item(config_item_id);


--
-- Name: product_config_option_iactn prod_optia_optn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_option_iactn
    ADD CONSTRAINT prod_optia_optn FOREIGN KEY (config_item_id, config_option_id) REFERENCES product_config_option(config_item_id, config_option_id);


--
-- Name: product_config_option_iactn prod_optia_optt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_option_iactn
    ADD CONSTRAINT prod_optia_optt FOREIGN KEY (config_item_id_to, config_option_id_to) REFERENCES product_config_option(config_item_id, config_option_id);


--
-- PostgreSQL database dump complete
--

