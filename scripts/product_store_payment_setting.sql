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
-- Name: product_store_payment_setting; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_payment_setting (
    product_store_id character varying(20) NOT NULL,
    payment_method_type_id character varying(20) NOT NULL,
    payment_service_type_enum_id character varying(20) NOT NULL,
    payment_service character varying(255),
    payment_custom_method_id character varying(20),
    payment_gateway_config_id character varying(20),
    payment_properties_path character varying(255),
    apply_to_all_products character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_payment_setting OWNER TO ofbiz;

--
-- Name: product_store_payment_setting pk_product_store_payment_setti; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_payment_setting
    ADD CONSTRAINT pk_product_store_payment_setti PRIMARY KEY (product_store_id, payment_method_type_id, payment_service_type_enum_id);


--
-- Name: prds_ps_cus_met; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prds_ps_cus_met ON product_store_payment_setting USING btree (payment_custom_method_id);


--
-- Name: prds_ps_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prds_ps_enum ON product_store_payment_setting USING btree (payment_service_type_enum_id);


--
-- Name: prds_ps_pgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prds_ps_pgc ON product_store_payment_setting USING btree (payment_gateway_config_id);


--
-- Name: prds_ps_pmnttp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prds_ps_pmnttp ON product_store_payment_setting USING btree (payment_method_type_id);


--
-- Name: prds_ps_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prds_ps_prds ON product_store_payment_setting USING btree (product_store_id);


--
-- Name: prt_str_pmt_stg_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_pmt_stg_tp ON product_store_payment_setting USING btree (last_updated_tx_stamp);


--
-- Name: prt_str_pmt_stg_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_pmt_stg_ts ON product_store_payment_setting USING btree (created_tx_stamp);


--
-- Name: product_store_payment_setting prds_ps_cus_met; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_payment_setting
    ADD CONSTRAINT prds_ps_cus_met FOREIGN KEY (payment_custom_method_id) REFERENCES custom_method(custom_method_id);


--
-- Name: product_store_payment_setting prds_ps_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_payment_setting
    ADD CONSTRAINT prds_ps_enum FOREIGN KEY (payment_service_type_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_store_payment_setting prds_ps_pgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_payment_setting
    ADD CONSTRAINT prds_ps_pgc FOREIGN KEY (payment_gateway_config_id) REFERENCES payment_gateway_config(payment_gateway_config_id);


--
-- Name: product_store_payment_setting prds_ps_pmnttp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_payment_setting
    ADD CONSTRAINT prds_ps_pmnttp FOREIGN KEY (payment_method_type_id) REFERENCES payment_method_type(payment_method_type_id);


--
-- Name: product_store_payment_setting prds_ps_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_payment_setting
    ADD CONSTRAINT prds_ps_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- PostgreSQL database dump complete
--

