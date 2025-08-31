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
-- Name: email_template_setting; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE email_template_setting (
    email_template_setting_id character varying(20) NOT NULL,
    email_type character varying(20),
    description character varying(255),
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


-- ALTER TABLE public.email_template_setting OWNER TO ofbiz;

--
-- Name: email_template_setting pk_email_template_setting; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY email_template_setting
    ADD CONSTRAINT pk_email_template_setting PRIMARY KEY (email_template_setting_id);


--
-- Name: emailset_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX emailset_enum ON email_template_setting USING btree (email_type);


--
-- Name: eml_tmpt_stg_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_tmpt_stg_txcrs ON email_template_setting USING btree (created_tx_stamp);


--
-- Name: eml_tmpt_stg_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_tmpt_stg_txstp ON email_template_setting USING btree (last_updated_tx_stamp);


--
-- Name: email_template_setting emailset_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY email_template_setting
    ADD CONSTRAINT emailset_enum FOREIGN KEY (email_type) REFERENCES enumeration(enum_id);


--
-- PostgreSQL database dump complete
--

