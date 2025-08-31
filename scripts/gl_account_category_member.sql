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
-- Name: gl_account_category_member; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gl_account_category_member (
    gl_account_id character varying(20) NOT NULL,
    gl_account_category_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    amount_percentage numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gl_account_category_member OWNER TO ofbiz;

--
-- Name: gl_account_category_member pk_gl_account_category_member; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_category_member
    ADD CONSTRAINT pk_gl_account_category_member PRIMARY KEY (gl_account_id, gl_account_category_id, from_date);


--
-- Name: gl_act_ctr_mmr_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_act_ctr_mmr_txp ON gl_account_category_member USING btree (last_updated_tx_stamp);


--
-- Name: gl_act_ctr_mmr_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_act_ctr_mmr_txs ON gl_account_category_member USING btree (created_tx_stamp);


--
-- Name: glact_catmbr_ac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glact_catmbr_ac ON gl_account_category_member USING btree (gl_account_id);


--
-- Name: glact_catmbr_cat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glact_catmbr_cat ON gl_account_category_member USING btree (gl_account_category_id);


--
-- Name: gl_account_category_member glact_catmbr_ac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_category_member
    ADD CONSTRAINT glact_catmbr_ac FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: gl_account_category_member glact_catmbr_cat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_category_member
    ADD CONSTRAINT glact_catmbr_cat FOREIGN KEY (gl_account_category_id) REFERENCES gl_account_category(gl_account_category_id);


--
-- PostgreSQL database dump complete
--

