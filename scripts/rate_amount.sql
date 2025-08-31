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
-- Name: rate_amount; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE rate_amount (
    rate_type_id character varying(20) NOT NULL,
    rate_currency_uom_id character varying(20) NOT NULL,
    period_type_id character varying(20) NOT NULL,
    work_effort_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    empl_position_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    rate_amount numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.rate_amount OWNER TO ofbiz;

--
-- Name: rate_amount pk_rate_amount; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY rate_amount
    ADD CONSTRAINT pk_rate_amount PRIMARY KEY (rate_type_id, rate_currency_uom_id, period_type_id, party_id, work_effort_id, empl_position_type_id, from_date);


--
-- Name: rate_amount_ept; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rate_amount_ept ON rate_amount USING btree (empl_position_type_id);


--
-- Name: rate_amount_pt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rate_amount_pt ON rate_amount USING btree (period_type_id);


--
-- Name: rate_amount_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rate_amount_pty ON rate_amount USING btree (party_id);


--
-- Name: rate_amount_rct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rate_amount_rct ON rate_amount USING btree (rate_currency_uom_id);


--
-- Name: rate_amount_rt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rate_amount_rt ON rate_amount USING btree (rate_type_id);


--
-- Name: rate_amount_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rate_amount_txcrts ON rate_amount USING btree (created_tx_stamp);


--
-- Name: rate_amount_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rate_amount_txstmp ON rate_amount USING btree (last_updated_tx_stamp);


--
-- Name: rate_amount_we; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rate_amount_we ON rate_amount USING btree (work_effort_id);


--
-- Name: rate_amount rate_amount_ept; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY rate_amount
    ADD CONSTRAINT rate_amount_ept FOREIGN KEY (empl_position_type_id) REFERENCES empl_position_type(empl_position_type_id);


--
-- Name: rate_amount rate_amount_pt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY rate_amount
    ADD CONSTRAINT rate_amount_pt FOREIGN KEY (period_type_id) REFERENCES period_type(period_type_id);


--
-- Name: rate_amount rate_amount_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY rate_amount
    ADD CONSTRAINT rate_amount_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: rate_amount rate_amount_rct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY rate_amount
    ADD CONSTRAINT rate_amount_rct FOREIGN KEY (rate_currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: rate_amount rate_amount_rt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY rate_amount
    ADD CONSTRAINT rate_amount_rt FOREIGN KEY (rate_type_id) REFERENCES rate_type(rate_type_id);


--
-- Name: rate_amount rate_amount_we; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY rate_amount
    ADD CONSTRAINT rate_amount_we FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

