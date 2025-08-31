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
-- Name: product_store_fin_act_setting; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_fin_act_setting (
    product_store_id character varying(20) NOT NULL,
    fin_account_type_id character varying(20) NOT NULL,
    require_pin_code character(1),
    validate_g_c_fin_acct character(1),
    account_code_length numeric(20,0),
    pin_code_length numeric(20,0),
    account_valid_days numeric(20,0),
    auth_valid_days numeric(20,0),
    purchase_survey_id character varying(20),
    purch_survey_send_to character varying(20),
    purch_survey_copy_me character varying(20),
    allow_auth_to_negative character(1),
    min_balance numeric(18,2),
    replenish_threshold numeric(18,2),
    replenish_method_enum_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_fin_act_setting OWNER TO ofbiz;

--
-- Name: product_store_fin_act_setting pk_product_store_fin_act_setti; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_fin_act_setting
    ADD CONSTRAINT pk_product_store_fin_act_setti PRIMARY KEY (product_store_id, fin_account_type_id);


--
-- Name: prstfnac_farpmtd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prstfnac_farpmtd ON product_store_fin_act_setting USING btree (replenish_method_enum_id);


--
-- Name: prstfnac_fnactp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prstfnac_fnactp ON product_store_fin_act_setting USING btree (fin_account_type_id);


--
-- Name: prstfnac_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prstfnac_prds ON product_store_fin_act_setting USING btree (product_store_id);


--
-- Name: prstfnac_srvy; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prstfnac_srvy ON product_store_fin_act_setting USING btree (purchase_survey_id);


--
-- Name: prt_fn_act_stg_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_fn_act_stg_tp ON product_store_fin_act_setting USING btree (last_updated_tx_stamp);


--
-- Name: prt_fn_act_stg_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_fn_act_stg_ts ON product_store_fin_act_setting USING btree (created_tx_stamp);


--
-- Name: product_store_fin_act_setting prstfnac_farpmtd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_fin_act_setting
    ADD CONSTRAINT prstfnac_farpmtd FOREIGN KEY (replenish_method_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_store_fin_act_setting prstfnac_fnactp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_fin_act_setting
    ADD CONSTRAINT prstfnac_fnactp FOREIGN KEY (fin_account_type_id) REFERENCES fin_account_type(fin_account_type_id);


--
-- Name: product_store_fin_act_setting prstfnac_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_fin_act_setting
    ADD CONSTRAINT prstfnac_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: product_store_fin_act_setting prstfnac_srvy; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_fin_act_setting
    ADD CONSTRAINT prstfnac_srvy FOREIGN KEY (purchase_survey_id) REFERENCES survey(survey_id);


--
-- PostgreSQL database dump complete
--

