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
-- Name: order_header_work_effort; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_header_work_effort (
    order_id character varying(20) NOT NULL,
    work_effort_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_header_work_effort OWNER TO ofbiz;

--
-- Name: order_header_work_effort pk_order_header_work_effort; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header_work_effort
    ADD CONSTRAINT pk_order_header_work_effort PRIMARY KEY (order_id, work_effort_id);


--
-- Name: orderhdwe_oh; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orderhdwe_oh ON order_header_work_effort USING btree (order_id);


--
-- Name: orderhdwe_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orderhdwe_weff ON order_header_work_effort USING btree (work_effort_id);


--
-- Name: orr_hdr_wrk_eft_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_hdr_wrk_eft_tp ON order_header_work_effort USING btree (last_updated_tx_stamp);


--
-- Name: orr_hdr_wrk_eft_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_hdr_wrk_eft_ts ON order_header_work_effort USING btree (created_tx_stamp);


--
-- Name: order_header_work_effort orderhdwe_oh; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header_work_effort
    ADD CONSTRAINT orderhdwe_oh FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_header_work_effort orderhdwe_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header_work_effort
    ADD CONSTRAINT orderhdwe_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

