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
-- Name: temporal_expression_assoc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE temporal_expression_assoc (
    from_temp_expr_id character varying(20) NOT NULL,
    to_temp_expr_id character varying(20) NOT NULL,
    expr_assoc_type character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.temporal_expression_assoc OWNER TO ofbiz;

--
-- Name: temporal_expression_assoc pk_temporal_expression_assoc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY temporal_expression_assoc
    ADD CONSTRAINT pk_temporal_expression_assoc PRIMARY KEY (from_temp_expr_id, to_temp_expr_id);


--
-- Name: temp_expr_from; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX temp_expr_from ON temporal_expression_assoc USING btree (from_temp_expr_id);


--
-- Name: temp_expr_to; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX temp_expr_to ON temporal_expression_assoc USING btree (to_temp_expr_id);


--
-- Name: tml_exprn_asc_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tml_exprn_asc_txcs ON temporal_expression_assoc USING btree (created_tx_stamp);


--
-- Name: tml_exprn_asc_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tml_exprn_asc_txsp ON temporal_expression_assoc USING btree (last_updated_tx_stamp);


--
-- Name: temporal_expression_assoc temp_expr_from; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY temporal_expression_assoc
    ADD CONSTRAINT temp_expr_from FOREIGN KEY (from_temp_expr_id) REFERENCES temporal_expression(temp_expr_id);


--
-- Name: temporal_expression_assoc temp_expr_to; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY temporal_expression_assoc
    ADD CONSTRAINT temp_expr_to FOREIGN KEY (to_temp_expr_id) REFERENCES temporal_expression(temp_expr_id);


--
-- PostgreSQL database dump complete
--

