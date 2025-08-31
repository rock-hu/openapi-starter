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
-- Name: allocation_plan_header; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE allocation_plan_header (
    plan_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    plan_type_id character varying(20),
    plan_name character varying(100),
    status_id character varying(20),
    created_by_user_login character varying(255),
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.allocation_plan_header OWNER TO ofbiz;

--
-- Name: allocation_plan_header pk_allocation_plan_header; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_header
    ADD CONSTRAINT pk_allocation_plan_header PRIMARY KEY (plan_id, product_id);


--
-- Name: alc_pln_hdr_cbul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alc_pln_hdr_cbul ON allocation_plan_header USING btree (created_by_user_login);


--
-- Name: alc_pln_hdr_lmul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alc_pln_hdr_lmul ON allocation_plan_header USING btree (last_modified_by_user_login);


--
-- Name: alc_pln_hdr_sts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alc_pln_hdr_sts ON allocation_plan_header USING btree (status_id);


--
-- Name: alc_pln_hdr_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alc_pln_hdr_typ ON allocation_plan_header USING btree (plan_type_id);


--
-- Name: alln_pln_hdr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alln_pln_hdr_txcrs ON allocation_plan_header USING btree (created_tx_stamp);


--
-- Name: alln_pln_hdr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX alln_pln_hdr_txstp ON allocation_plan_header USING btree (last_updated_tx_stamp);


--
-- Name: allocation_plan_header alc_pln_hdr_cbul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_header
    ADD CONSTRAINT alc_pln_hdr_cbul FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: allocation_plan_header alc_pln_hdr_lmul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_header
    ADD CONSTRAINT alc_pln_hdr_lmul FOREIGN KEY (last_modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: allocation_plan_header alc_pln_hdr_sts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_header
    ADD CONSTRAINT alc_pln_hdr_sts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: allocation_plan_header alc_pln_hdr_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_header
    ADD CONSTRAINT alc_pln_hdr_typ FOREIGN KEY (plan_type_id) REFERENCES allocation_plan_type(plan_type_id);


--
-- PostgreSQL database dump complete
--

