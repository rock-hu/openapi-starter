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
-- Name: training_class_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE training_class_type (
    training_class_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.training_class_type OWNER TO ofbiz;

--
-- Name: training_class_type pk_training_class_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY training_class_type
    ADD CONSTRAINT pk_training_class_type PRIMARY KEY (training_class_type_id);


--
-- Name: train_type_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX train_type_par ON training_class_type USING btree (parent_type_id);


--
-- Name: trng_cls_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trng_cls_tp_txcrts ON training_class_type USING btree (created_tx_stamp);


--
-- Name: trng_cls_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trng_cls_tp_txstmp ON training_class_type USING btree (last_updated_tx_stamp);


--
-- Name: training_class_type train_type_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY training_class_type
    ADD CONSTRAINT train_type_par FOREIGN KEY (parent_type_id) REFERENCES training_class_type(training_class_type_id);


--
-- PostgreSQL database dump complete
--

