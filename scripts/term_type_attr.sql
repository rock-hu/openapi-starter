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
-- Name: term_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE term_type_attr (
    term_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.term_type_attr OWNER TO ofbiz;

--
-- Name: term_type_attr pk_term_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY term_type_attr
    ADD CONSTRAINT pk_term_type_attr PRIMARY KEY (term_type_id, attr_name);


--
-- Name: term_typatr_ttyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX term_typatr_ttyp ON term_type_attr USING btree (term_type_id);


--
-- Name: trm_tp_attr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trm_tp_attr_txcrts ON term_type_attr USING btree (created_tx_stamp);


--
-- Name: trm_tp_attr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trm_tp_attr_txstmp ON term_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: term_type_attr term_typatr_ttyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY term_type_attr
    ADD CONSTRAINT term_typatr_ttyp FOREIGN KEY (term_type_id) REFERENCES term_type(term_type_id);


--
-- PostgreSQL database dump complete
--

