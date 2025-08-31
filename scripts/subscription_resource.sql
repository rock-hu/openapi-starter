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
-- Name: subscription_resource; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE subscription_resource (
    subscription_resource_id character varying(20) NOT NULL,
    parent_resource_id character varying(20),
    description character varying(255),
    content_id character varying(20),
    web_site_id character varying(20),
    service_name_on_expiry character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.subscription_resource OWNER TO ofbiz;

--
-- Name: subscription_resource pk_subscription_resource; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_resource
    ADD CONSTRAINT pk_subscription_resource PRIMARY KEY (subscription_resource_id);


--
-- Name: sbscrpn_rsc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscrpn_rsc_txcrts ON subscription_resource USING btree (created_tx_stamp);


--
-- Name: sbscrpn_rsc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscrpn_rsc_txstmp ON subscription_resource USING btree (last_updated_tx_stamp);


--
-- Name: subsc_res_cntnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_res_cntnt ON subscription_resource USING btree (content_id);


--
-- Name: subsc_res_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_res_parent ON subscription_resource USING btree (parent_resource_id);


--
-- Name: subsc_res_wbsite; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_res_wbsite ON subscription_resource USING btree (web_site_id);


--
-- Name: subscription_resource subsc_res_cntnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_resource
    ADD CONSTRAINT subsc_res_cntnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: subscription_resource subsc_res_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_resource
    ADD CONSTRAINT subsc_res_parent FOREIGN KEY (parent_resource_id) REFERENCES subscription_resource(subscription_resource_id);


--
-- Name: subscription_resource subsc_res_wbsite; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_resource
    ADD CONSTRAINT subsc_res_wbsite FOREIGN KEY (web_site_id) REFERENCES web_site(web_site_id);


--
-- PostgreSQL database dump complete
--

