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
-- Name: quote_work_effort; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE quote_work_effort (
    quote_id character varying(20) NOT NULL,
    work_effort_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.quote_work_effort OWNER TO ofbiz;

--
-- Name: quote_work_effort pk_quote_work_effort; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_work_effort
    ADD CONSTRAINT pk_quote_work_effort PRIMARY KEY (quote_id, work_effort_id);


--
-- Name: qt_wrk_efft_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX qt_wrk_efft_txcrts ON quote_work_effort USING btree (created_tx_stamp);


--
-- Name: qt_wrk_efft_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX qt_wrk_efft_txstmp ON quote_work_effort USING btree (last_updated_tx_stamp);


--
-- Name: quote_we_quote; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_we_quote ON quote_work_effort USING btree (quote_id);


--
-- Name: quote_we_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_we_weff ON quote_work_effort USING btree (work_effort_id);


--
-- Name: quote_work_effort quote_we_quote; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_work_effort
    ADD CONSTRAINT quote_we_quote FOREIGN KEY (quote_id) REFERENCES quote(quote_id);


--
-- Name: quote_work_effort quote_we_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_work_effort
    ADD CONSTRAINT quote_we_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

