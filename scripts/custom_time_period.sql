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
-- Name: custom_time_period; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE custom_time_period (
    custom_time_period_id character varying(20) NOT NULL,
    parent_period_id character varying(20),
    period_type_id character varying(20),
    period_num numeric(20,0),
    period_name character varying(100),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    is_closed character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone,
    organization_party_id character varying(20)
);


-- ALTER TABLE public.custom_time_period OWNER TO ofbiz;

--
-- Name: custom_time_period pk_custom_time_period; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY custom_time_period
    ADD CONSTRAINT pk_custom_time_period PRIMARY KEY (custom_time_period_id);


--
-- Name: cstm_tm_prd_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cstm_tm_prd_txcrts ON custom_time_period USING btree (created_tx_stamp);


--
-- Name: cstm_tm_prd_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cstm_tm_prd_txstmp ON custom_time_period USING btree (last_updated_tx_stamp);


--
-- Name: org_prd_parper; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX org_prd_parper ON custom_time_period USING btree (parent_period_id);


--
-- Name: org_prd_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX org_prd_party ON custom_time_period USING btree (organization_party_id);


--
-- Name: org_prd_pertyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX org_prd_pertyp ON custom_time_period USING btree (period_type_id);


--
-- Name: custom_time_period org_prd_parper; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY custom_time_period
    ADD CONSTRAINT org_prd_parper FOREIGN KEY (parent_period_id) REFERENCES custom_time_period(custom_time_period_id);


--
-- Name: custom_time_period org_prd_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY custom_time_period
    ADD CONSTRAINT org_prd_party FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- Name: custom_time_period org_prd_pertyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY custom_time_period
    ADD CONSTRAINT org_prd_pertyp FOREIGN KEY (period_type_id) REFERENCES period_type(period_type_id);


--
-- PostgreSQL database dump complete
--

