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
-- Name: order_term; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_term (
    term_type_id character varying(20) NOT NULL,
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    term_value numeric(18,2),
    term_days numeric(20,0),
    text_value character varying(255),
    description character varying(255),
    uom_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_term OWNER TO ofbiz;

--
-- Name: order_term pk_order_term; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_term
    ADD CONSTRAINT pk_order_term PRIMARY KEY (term_type_id, order_id, order_item_seq_id);


--
-- Name: order_term_ohdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_term_ohdr ON order_term USING btree (order_id);


--
-- Name: order_term_ttype; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_term_ttype ON order_term USING btree (term_type_id);


--
-- Name: order_term_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_term_txcrts ON order_term USING btree (created_tx_stamp);


--
-- Name: order_term_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_term_txstmp ON order_term USING btree (last_updated_tx_stamp);


--
-- Name: order_term_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_term_uom ON order_term USING btree (uom_id);


--
-- Name: order_term order_term_ohdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_term
    ADD CONSTRAINT order_term_ohdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_term order_term_ttype; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_term
    ADD CONSTRAINT order_term_ttype FOREIGN KEY (term_type_id) REFERENCES term_type(term_type_id);


--
-- Name: order_term order_term_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_term
    ADD CONSTRAINT order_term_uom FOREIGN KEY (uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

