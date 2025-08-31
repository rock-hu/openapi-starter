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
-- Name: tracking_code; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tracking_code (
    tracking_code_id character varying(20) NOT NULL,
    tracking_code_type_id character varying(20),
    marketing_campaign_id character varying(20),
    redirect_url character varying(2000),
    override_logo character varying(2000),
    override_css character varying(2000),
    prod_catalog_id character varying(20),
    comments character varying(255),
    description character varying(255),
    trackable_lifetime numeric(20,0),
    billable_lifetime numeric(20,0),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    group_id character varying(20),
    subgroup_id character varying(20),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tracking_code OWNER TO ofbiz;

--
-- Name: tracking_code pk_tracking_code; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code
    ADD CONSTRAINT pk_tracking_code PRIMARY KEY (tracking_code_id);


--
-- Name: tkng_cod_mkcmpn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tkng_cod_mkcmpn ON tracking_code USING btree (marketing_campaign_id);


--
-- Name: tkng_cod_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tkng_cod_typ ON tracking_code USING btree (tracking_code_type_id);


--
-- Name: trckng_cd_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trckng_cd_txcrts ON tracking_code USING btree (created_tx_stamp);


--
-- Name: trckng_cd_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trckng_cd_txstmp ON tracking_code USING btree (last_updated_tx_stamp);


--
-- Name: tracking_code tkng_cod_mkcmpn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code
    ADD CONSTRAINT tkng_cod_mkcmpn FOREIGN KEY (marketing_campaign_id) REFERENCES marketing_campaign(marketing_campaign_id);


--
-- Name: tracking_code tkng_cod_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code
    ADD CONSTRAINT tkng_cod_typ FOREIGN KEY (tracking_code_type_id) REFERENCES tracking_code_type(tracking_code_type_id);


--
-- PostgreSQL database dump complete
--

