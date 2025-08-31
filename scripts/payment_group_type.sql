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
-- Name: payment_group_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_group_type (
    payment_group_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_group_type OWNER TO ofbiz;

--
-- Name: payment_group_type pk_payment_group_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_group_type
    ADD CONSTRAINT pk_payment_group_type PRIMARY KEY (payment_group_type_id);


--
-- Name: paymntgp_typ_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paymntgp_typ_par ON payment_group_type USING btree (parent_type_id);


--
-- Name: pmnt_grp_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_grp_tp_txcrts ON payment_group_type USING btree (created_tx_stamp);


--
-- Name: pmnt_grp_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_grp_tp_txstmp ON payment_group_type USING btree (last_updated_tx_stamp);


--
-- Name: payment_group_type paymntgp_typ_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_group_type
    ADD CONSTRAINT paymntgp_typ_par FOREIGN KEY (parent_type_id) REFERENCES payment_group_type(payment_group_type_id);


--
-- PostgreSQL database dump complete
--

