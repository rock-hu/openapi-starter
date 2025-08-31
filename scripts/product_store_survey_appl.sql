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
-- Name: product_store_survey_appl; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_survey_appl (
    product_store_survey_id character varying(20) NOT NULL,
    product_store_id character varying(20),
    survey_appl_type_id character varying(20),
    group_name character varying(100),
    survey_id character varying(20),
    product_id character varying(20),
    product_category_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    survey_template character varying(255),
    result_template character varying(255),
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_survey_appl OWNER TO ofbiz;

--
-- Name: product_store_survey_appl pk_product_store_survey_appl; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_survey_appl
    ADD CONSTRAINT pk_product_store_survey_appl PRIMARY KEY (product_store_survey_id);


--
-- Name: prdstrsvy_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrsvy_prds ON product_store_survey_appl USING btree (product_store_id);


--
-- Name: prdstrsvy_satp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrsvy_satp ON product_store_survey_appl USING btree (survey_appl_type_id);


--
-- Name: prdstrsvy_srvy; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrsvy_srvy ON product_store_survey_appl USING btree (survey_id);


--
-- Name: prt_str_srv_apl_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_srv_apl_tp ON product_store_survey_appl USING btree (last_updated_tx_stamp);


--
-- Name: prt_str_srv_apl_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_srv_apl_ts ON product_store_survey_appl USING btree (created_tx_stamp);


--
-- Name: product_store_survey_appl prdstrsvy_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_survey_appl
    ADD CONSTRAINT prdstrsvy_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: product_store_survey_appl prdstrsvy_satp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_survey_appl
    ADD CONSTRAINT prdstrsvy_satp FOREIGN KEY (survey_appl_type_id) REFERENCES survey_appl_type(survey_appl_type_id);


--
-- Name: product_store_survey_appl prdstrsvy_srvy; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_survey_appl
    ADD CONSTRAINT prdstrsvy_srvy FOREIGN KEY (survey_id) REFERENCES survey(survey_id);


--
-- PostgreSQL database dump complete
--

