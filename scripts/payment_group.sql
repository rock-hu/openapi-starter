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
-- Name: payment_group; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_group (
    payment_group_id character varying(20) NOT NULL,
    payment_group_type_id character varying(20),
    payment_group_name character varying(100),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_group OWNER TO ofbiz;

--
-- Name: payment_group pk_payment_group; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_group
    ADD CONSTRAINT pk_payment_group PRIMARY KEY (payment_group_id);


--
-- Name: paymntgp_pgtype; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paymntgp_pgtype ON payment_group USING btree (payment_group_type_id);


--
-- Name: pmnt_grp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_grp_txcrts ON payment_group USING btree (created_tx_stamp);


--
-- Name: pmnt_grp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_grp_txstmp ON payment_group USING btree (last_updated_tx_stamp);


--
-- Name: payment_group paymntgp_pgtype; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_group
    ADD CONSTRAINT paymntgp_pgtype FOREIGN KEY (payment_group_type_id) REFERENCES payment_group_type(payment_group_type_id);


--
-- PostgreSQL database dump complete
--

