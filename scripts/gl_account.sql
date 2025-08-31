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
-- Name: gl_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gl_account (
    gl_account_id character varying(20) NOT NULL,
    gl_account_type_id character varying(20),
    gl_account_class_id character varying(20),
    gl_resource_type_id character varying(20),
    gl_xbrl_class_id character varying(20),
    parent_gl_account_id character varying(20),
    account_code character varying(100),
    account_name character varying(100),
    description character varying(255),
    product_id character varying(20),
    external_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gl_account OWNER TO ofbiz;

--
-- Name: gl_account pk_gl_account; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account
    ADD CONSTRAINT pk_gl_account PRIMARY KEY (gl_account_id);


--
-- Name: gl_account_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_account_txcrts ON gl_account USING btree (created_tx_stamp);


--
-- Name: gl_account_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_account_txstmp ON gl_account USING btree (last_updated_tx_stamp);


--
-- Name: glacct_clss; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_clss ON gl_account USING btree (gl_account_class_id);


--
-- Name: glacct_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_par ON gl_account USING btree (parent_gl_account_id);


--
-- Name: glacct_rec; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_rec ON gl_account USING btree (gl_resource_type_id);


--
-- Name: glacct_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_type ON gl_account USING btree (gl_account_type_id);


--
-- Name: glacct_unqcd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE UNIQUE INDEX glacct_unqcd ON gl_account USING btree (account_code);


--
-- Name: glacct_xbrlcls; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_xbrlcls ON gl_account USING btree (gl_xbrl_class_id);


--
-- Name: gl_account glacct_clss; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account
    ADD CONSTRAINT glacct_clss FOREIGN KEY (gl_account_class_id) REFERENCES gl_account_class(gl_account_class_id);


--
-- Name: gl_account glacct_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account
    ADD CONSTRAINT glacct_par FOREIGN KEY (parent_gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: gl_account glacct_rec; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account
    ADD CONSTRAINT glacct_rec FOREIGN KEY (gl_resource_type_id) REFERENCES gl_resource_type(gl_resource_type_id);


--
-- Name: gl_account glacct_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account
    ADD CONSTRAINT glacct_type FOREIGN KEY (gl_account_type_id) REFERENCES gl_account_type(gl_account_type_id);


--
-- Name: gl_account glacct_xbrlcls; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account
    ADD CONSTRAINT glacct_xbrlcls FOREIGN KEY (gl_xbrl_class_id) REFERENCES gl_xbrl_class(gl_xbrl_class_id);


--
-- PostgreSQL database dump complete
--

