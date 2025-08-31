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
-- Name: product_store_email_setting; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_email_setting (
    product_store_id character varying(20) NOT NULL,
    email_type character varying(20) NOT NULL,
    body_screen_location character varying(255),
    xslfo_attach_screen_location character varying(255),
    from_address character varying(320),
    cc_address character varying(320),
    bcc_address character varying(320),
    subject character varying(255),
    content_type character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_email_setting OWNER TO ofbiz;

--
-- Name: product_store_email_setting pk_product_store_email_setting; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_email_setting
    ADD CONSTRAINT pk_product_store_email_setting PRIMARY KEY (product_store_id, email_type);


--
-- Name: prdstrem_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrem_enum ON product_store_email_setting USING btree (email_type);


--
-- Name: prdstrem_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrem_prds ON product_store_email_setting USING btree (product_store_id);


--
-- Name: prt_str_eml_stg_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_eml_stg_tp ON product_store_email_setting USING btree (last_updated_tx_stamp);


--
-- Name: prt_str_eml_stg_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_eml_stg_ts ON product_store_email_setting USING btree (created_tx_stamp);


--
-- Name: product_store_email_setting prdstrem_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_email_setting
    ADD CONSTRAINT prdstrem_enum FOREIGN KEY (email_type) REFERENCES enumeration(enum_id);


--
-- Name: product_store_email_setting prdstrem_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_email_setting
    ADD CONSTRAINT prdstrem_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- PostgreSQL database dump complete
--

