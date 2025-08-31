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
-- Name: product_store_telecom_setting; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_telecom_setting (
    product_store_id character varying(20) NOT NULL,
    telecom_method_type_id character varying(20) NOT NULL,
    telecom_msg_type_enum_id character varying(20) NOT NULL,
    telecom_custom_method_id character varying(20),
    telecom_gateway_config_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_telecom_setting OWNER TO ofbiz;

--
-- Name: product_store_telecom_setting pk_product_store_telecom_setti; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_telecom_setting
    ADD CONSTRAINT pk_product_store_telecom_setti PRIMARY KEY (product_store_id, telecom_method_type_id, telecom_msg_type_enum_id);


--
-- Name: prds_ts_cus_met; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prds_ts_cus_met ON product_store_telecom_setting USING btree (telecom_custom_method_id);


--
-- Name: prds_ts_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prds_ts_enum ON product_store_telecom_setting USING btree (telecom_msg_type_enum_id);


--
-- Name: prds_ts_pgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prds_ts_pgc ON product_store_telecom_setting USING btree (telecom_gateway_config_id);


--
-- Name: prds_ts_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prds_ts_prds ON product_store_telecom_setting USING btree (product_store_id);


--
-- Name: prds_ts_teltp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prds_ts_teltp ON product_store_telecom_setting USING btree (telecom_method_type_id);


--
-- Name: prt_str_tlm_stg_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_tlm_stg_tp ON product_store_telecom_setting USING btree (last_updated_tx_stamp);


--
-- Name: prt_str_tlm_stg_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_tlm_stg_ts ON product_store_telecom_setting USING btree (created_tx_stamp);


--
-- Name: product_store_telecom_setting prds_ts_cus_met; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_telecom_setting
    ADD CONSTRAINT prds_ts_cus_met FOREIGN KEY (telecom_custom_method_id) REFERENCES custom_method(custom_method_id);


--
-- Name: product_store_telecom_setting prds_ts_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_telecom_setting
    ADD CONSTRAINT prds_ts_enum FOREIGN KEY (telecom_msg_type_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_store_telecom_setting prds_ts_pgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_telecom_setting
    ADD CONSTRAINT prds_ts_pgc FOREIGN KEY (telecom_gateway_config_id) REFERENCES telecom_gateway_config(telecom_gateway_config_id);


--
-- Name: product_store_telecom_setting prds_ts_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_telecom_setting
    ADD CONSTRAINT prds_ts_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: product_store_telecom_setting prds_ts_teltp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_telecom_setting
    ADD CONSTRAINT prds_ts_teltp FOREIGN KEY (telecom_method_type_id) REFERENCES telecom_method_type(telecom_method_type_id);


--
-- PostgreSQL database dump complete
--

